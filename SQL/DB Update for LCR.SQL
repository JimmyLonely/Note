USE [MoneyTransferCore]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================================================
IF NOT EXISTS (	SELECT * FROM sys.indexes 
				WHERE	object_id = OBJECT_ID(N'[dbo].[group_member]') 
				AND		name = N'IX_group_member_member_id_INCLUDE')
	CREATE NONCLUSTERED INDEX [IX_group_member_member_id_INCLUDE] 
		ON [dbo].[group_member]
			(
			[member_id] ASC
			)
	INCLUDE
			(
			[group_id],
			[active_from],
			[active_to]
			)
		
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

-- ============================================================================================
IF  EXISTS (	SELECT * FROM sys.objects 
				WHERE	object_id = OBJECT_ID(N'[dbo].[FN_get_lcr_group_override]') 
				AND		type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION [dbo].[FN_get_lcr_group_override]
GO

-- ============================================================================================
-- Author:		Alex Zarenin
-- Create date: 2015-12-28
-- Description:	Given Business ID, Group ID, and AgentGroup ID retrieves
--				Standard, Next Day, and Same Day overrides and providers
-- ============================================================================================
CREATE FUNCTION FN_get_lcr_group_override 
	(	
	@BusinessID		bigint,
	@GroupID		bigint,
	@AgentGroupID	bigint		
	)
RETURNS TABLE 
AS
RETURN 
	(
	with	lcrOverride
		as
		(
			SELECT
						override_id				= coalesce(bgo_a.lcr_biller_group_override_id,	bgo_ag.lcr_biller_group_override_id,	bgo_sa.lcr_biller_group_override_id), 
						override_entity_type_id	= coalesce(bgo_a.override_entity_type_id,		bgo_ag.override_entity_type_id,			bgo_sa.override_entity_type_id), 
						override_entity_id		= coalesce(bgo_a.override_entity_id,			bgo_ag.override_entity_id,				bgo_sa.override_entity_id) 

			FROM
					lcr_biller_group_override		base	with(nolock) 

				LEFT OUTER JOIN
					lcr_biller_group_override		bgo_a	with(nolock) 
						on	bgo_a.lcr_biller_group_override_id	= base.lcr_biller_group_override_id
						and	bgo_a.override_entity_id			= @BusinessID 
						and	bgo_a.override_entity_type_id		= 3 
				
				LEFT OUTER JOIN
					lcr_biller_group_override		bgo_ag	with(nolock) 
						on	bgo_ag.lcr_biller_group_override_id	= base.lcr_biller_group_override_id
						and	bgo_ag.override_entity_id			= @AgentGroupID 
						and	bgo_ag.override_entity_type_id		= 2 
				
				LEFT OUTER JOIN
					lcr_biller_group_override		bgo_sa	with(nolock) 
					inner join 
						business			sa	with(nolock) 
							on  bgo_sa.override_entity_id		= sa.business_id
							and	sa.business_type_id = 9 
					inner join 
						business			a	with(nolock)
							on  a.business_id		= @BusinessID
							and sa.business_id		= a.parent_business_id
							 

						on	bgo_sa.lcr_biller_group_override_id	= base.lcr_biller_group_override_id						 
						and bgo_sa.override_entity_type_id	= 1 
						
			
			WHERE
					base.lcr_biller_group_id	= @GroupID 
			and		base.active					= 1	
			and		coalesce(bgo_a.lcr_biller_group_override_id,	bgo_ag.lcr_biller_group_override_id,	bgo_sa.lcr_biller_group_override_id) is not null					
		),
		
			DirectMember
		as
		(
		select 
				m.[primary],
				[biller_id],
				[provider_id],

				[standard]			= case when m.bill_payment_type_id = 1 then m.lcr_biller_group_member_id end,
				[next_day]			= case when m.bill_payment_type_id = 2 then m.lcr_biller_group_member_id end,
				[same_day]			= case when m.bill_payment_type_id = 3 then m.lcr_biller_group_member_id end,
				[standard_provider]	= case when m.bill_payment_type_id = 1 then m.provider_id end,
				[next_day_provider]	= case when m.bill_payment_type_id = 2 then m.provider_id end,
				[same_day_provider]	= case when m.bill_payment_type_id = 3 then m.provider_id end
			from
				lcr_biller_group_member m with(nolock)
		where
				coalesce
					(
					case when m.bill_payment_type_id = 1 then m.lcr_biller_group_member_id end,
					case when m.bill_payment_type_id = 2 then m.lcr_biller_group_member_id end,
					case when m.bill_payment_type_id = 3 then m.lcr_biller_group_member_id end
					) is not null
		and		m.lcr_biller_group_id = @GroupID
		),
			OverrideMember
		as
		(
		select
				m.[primary],
				[biller_id],
				[provider_id], 
				--------------------------------------------- 
				override_id				= lcr.override_id, 
				override_entity_type_id	= lcr.override_entity_type_id, 
				override_entity_id		= lcr.override_entity_id, 
				--------------------------------------------- 
				[standard]			= case when m.bill_payment_type_id = 1 then m.lcr_biller_group_member_id end,
				[next_day]			= case when m.bill_payment_type_id = 2 then m.lcr_biller_group_member_id end,
				[same_day]			= case when m.bill_payment_type_id = 3 then m.lcr_biller_group_member_id end,
				[standard_provider]	= case when m.bill_payment_type_id = 1 then m.provider_id end,
				[next_day_provider]	= case when m.bill_payment_type_id = 2 then m.provider_id end,
				[same_day_provider]	= case when m.bill_payment_type_id = 3 then m.provider_id end
		from
				lcrOverride		lcr
			inner join			 
				lcr_biller_group_override_member	bgo_m	with(nolock)
					on bgo_m.lcr_biller_group_override_id = lcr.override_id
			inner join
				lcr_biller_group_member				m		with(nolock) 
					on	m.lcr_biller_group_member_id = bgo_m.lcr_biller_group_member_id
		where
				coalesce
					(
					case when m.bill_payment_type_id = 1 then m.lcr_biller_group_member_id end,
					case when m.bill_payment_type_id = 2 then m.lcr_biller_group_member_id end,
					case when m.bill_payment_type_id = 3 then m.lcr_biller_group_member_id end
					) is not null
		)
	select 
			--------------------------------------------- 
			override_id				= OM.override_id, 
			override_entity_type_id	= OM.override_entity_type_id, 
			override_entity_id		= OM.override_entity_id, 
			--------------------------------------------- 
			biller_id				=	COALESCE(OM.biller_id,DM.biller_id),
			provider_id				=	COALESCE(OM.provider_id,DM.provider_id),
			--------------------------------------------- 
			IsPrimary				=	COALESCE(OM.[primary],			 DM.[primary]),
			--------------------------------------------- 
			[standard]				=	COALESCE(OM.[standard],			 DM.[standard]),
			[next_day]				=	COALESCE(OM.[next_day],			 DM.[next_day]),
			[same_day]				=	COALESCE(OM.[same_day],			 DM.[same_day]),
			[standard_provider]		=	COALESCE(OM.[standard_provider], DM.[standard_provider]),
			[next_day_provider]		=	COALESCE(OM.[next_day_provider], DM.[next_day_provider]),
			[same_day_provider]		=	COALESCE(OM.[same_day_provider], DM.[same_day_provider])
	from
			OverrideMember		OM
		full outer join
			(
			select	*
			from	DirectMember		
			where	Not Exists (select * from OverrideMember)
			)					DM
				on	OM.[biller_id]		= DM.[biller_id]
				and	OM.[provider_id]	= DM.[provider_id]
	
	)
GO

-- ============================================================================================
IF  EXISTS (	SELECT * FROM sys.objects 
				WHERE object_id = OBJECT_ID(N'[dbo].[usp_get_lcr_group_winning_members_Old]') 
				AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_get_lcr_group_winning_members_Old]
GO

IF NOT EXISTS (	SELECT * FROM sys.objects 
				WHERE object_id = OBJECT_ID(N'[dbo].[usp_get_lcr_group_winning_members_Old]') 
				AND type in (N'P', N'PC'))
BEGIN
	EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_get_lcr_group_winning_members_Old] AS' 
END
GO

-- =============================================
-- Author:		Keith McLoughlin
-- Create date: 7/1/2014
-- Description:	Gets posting time category winners for given biller group for a specific agent
-- =============================================
ALTER PROCEDURE [dbo].[usp_get_lcr_group_winning_members_Old]
(
	@business_id bigint,
	@group_id bigint
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	

select
	wm.lcr_biller_group_member_id,
	wm.lcr_biller_group_id,
	wm.biller_id,
	wm.provider_id,
	wm.bill_payment_type_id,
	wm.active,
	wm.[primary]
from
	lcr_biller_group_member wm with(nolock)
	inner join
(	select 
		--InnerQuery.lcr_biller_group_member_id,
--		InnerQuery.lcr_biller_group_id, 
--		InnerQuery.override_entity_type_id, 
--		InnerQuery.lcr_biller_group_id, 
--		InnerQuery.super_agent_id, 
--		InnerQuery.agent_group_id, 
--		InnerQuery.agent_id, 
--		InnerQuery.override_id, 
--		InnerQuery.override_entity_id, 
--		InnerQuery.group_name,
--		ot.lcr_override_entity_type_name as override_level,
--		o.override_name,
		InnerQuery.[standard] as standard_id,
		InnerQuery.next_day as next_day_id,
		InnerQuery.same_day as same_day_id
--		InnerQuery.standard_provider as standard_provider_id,
--		InnerQuery.next_day_provider as next_day_provider_id,
--		InnerQuery.same_day_provider as same_day_provider_id,
--		p_standard.processor_name + ' -> ' + rpb.[Biller Name] as [standard],
--		p_next.processor_name + ' -> ' + bil_next.biller_name as next_day,
--		p_same.processor_name + ' -> ' + bil_same.biller_name as same_day
	from
		(select 
			bg.lcr_biller_group_id, bg.group_name, sa.business_id as super_agent_id, ag.group_id as agent_group_id, a.business_id as agent_id, 
			coalesce(bgo_a.lcr_biller_group_override_id, bgo_ag.lcr_biller_group_override_id, bgo_sa.lcr_biller_group_override_id) as override_id, 
			coalesce(bgo_a.override_entity_type_id, bgo_ag.override_entity_type_id, bgo_sa.override_entity_type_id) as override_entity_type_id, 
			coalesce(bgo_a.override_entity_id, bgo_ag.override_entity_id, bgo_sa.override_entity_id) as override_entity_id, 
			--bgo_a.lcr_biller_group_id, bgo_ag.lcr_biller_group_id, bgo_sa.lcr_biller_group_id,
			case 
				when coalesce(bgo_a.lcr_biller_group_override_id, bgo_ag.lcr_biller_group_override_id, bgo_sa.lcr_biller_group_override_id) is not null
				then bgo_m.[standard] else m.[standard] 
			end as [standard],
			case 
				when coalesce(bgo_a.lcr_biller_group_override_id, bgo_ag.lcr_biller_group_override_id, bgo_sa.lcr_biller_group_override_id) is not null
				then bgo_m.[next_day] else m.[next_day] 
			end as [next_day],
			case 
				when coalesce(bgo_a.lcr_biller_group_override_id, bgo_ag.lcr_biller_group_override_id, bgo_sa.lcr_biller_group_override_id) is not null
				then bgo_m.[same_day] else m.[same_day] 
			end as [same_day],
			case 
				when coalesce(bgo_a.lcr_biller_group_override_id, bgo_ag.lcr_biller_group_override_id, bgo_sa.lcr_biller_group_override_id) is not null
				then bgo_m.[standard_provider] else m.[standard_provider] 
			end as [standard_provider],
			case 
				when coalesce(bgo_a.lcr_biller_group_override_id, bgo_ag.lcr_biller_group_override_id, bgo_sa.lcr_biller_group_override_id) is not null
				then bgo_m.[next_day_provider] else m.[next_day_provider] 
			end as [next_day_provider],
			case 
				when coalesce(bgo_a.lcr_biller_group_override_id, bgo_ag.lcr_biller_group_override_id, bgo_sa.lcr_biller_group_override_id) is not null
				then bgo_m.[same_day_provider] else m.[same_day_provider] 
			end as [same_day_provider]--,
		--	m.[standard] as [standard_default],
		--	m.[next_day] as [next_day_default],
		--	m.[same_day] as [same_day_default],
		--	bgo_m.[standard] as [standard_override],
		--	bgo_m.[next_day] as [next_day_override],
		--	bgo_m.[same_day] as [same_day_override]
		from 
			business a with(nolock)
		cross join 
			lcr_biller_group bg with(nolock)
		left outer join 
			business sa with(nolock) on sa.business_type_id = 9 and sa.business_id = a.parent_business_id

		left outer join
			(select 
				ag.member_id, g.group_id
			 from 
				[group] g with(nolock) 
			 inner join 
				group_member ag with(nolock) on g.group_id = ag.group_id
			 where 
				ag.member_id = @business_id and g.group_type_id = 1 and g.group_category_id = 3 and g.group_status_id <> 3) ag on ag.member_id = a.business_id

		left outer join 
			lcr_biller_group_override bgo_a with(nolock) 
				on bgo_a.lcr_biller_group_id = bg.lcr_biller_group_id 
				and bgo_a.override_entity_id = a.business_id 
				and bgo_a.override_entity_type_id = 3 and bgo_a.active = 1
		left outer join 
			lcr_biller_group_override bgo_ag with(nolock) 
				on bgo_ag.lcr_biller_group_id = bg.lcr_biller_group_id 
				and bgo_ag.override_entity_id = ag.group_id 
				and bgo_ag.override_entity_type_id = 2 and bgo_ag.active = 1
		left outer join 
			lcr_biller_group_override bgo_sa with(nolock) 
				on bgo_sa.lcr_biller_group_id = bg.lcr_biller_group_id 
				and bgo_sa.override_entity_id = sa.business_id 
				and bgo_sa.override_entity_type_id = 1 and bgo_sa.active = 1

		left outer join
		(select 
			bgo_m.lcr_biller_group_override_id, 
			sum(case when bgo_m.[primary] = 1 and m.bill_payment_type_id = 1 then m.lcr_biller_group_member_id else null end) as [standard],
			sum(case when bgo_m.[primary] = 1 and m.bill_payment_type_id = 2 then m.lcr_biller_group_member_id else null end) as [next_day],
			sum(case when bgo_m.[primary] = 1 and m.bill_payment_type_id = 3 then m.lcr_biller_group_member_id else null end) as [same_day],
			sum(case when bgo_m.[primary] = 1 and m.bill_payment_type_id = 1 then m.provider_id else null end) as [standard_provider],
			sum(case when bgo_m.[primary] = 1 and m.bill_payment_type_id = 2 then m.provider_id else null end) as [next_day_provider],
			sum(case when bgo_m.[primary] = 1 and m.bill_payment_type_id = 3 then m.provider_id else null end) as [same_day_provider]
		 from
			lcr_biller_group_override_member bgo_m with(nolock)
		 inner join
			lcr_biller_group_member m with(nolock) on m.lcr_biller_group_member_id = bgo_m.lcr_biller_group_member_id
		 group by
			bgo_m.lcr_biller_group_override_id
		) bgo_m on bgo_m.lcr_biller_group_override_id = coalesce(bgo_a.lcr_biller_group_override_id, bgo_ag.lcr_biller_group_override_id, bgo_sa.lcr_biller_group_override_id, -1)

		left outer join
			(select 
				m.lcr_biller_group_id, 
				sum(case when m.[primary] = 1 and m.bill_payment_type_id = 1 then m.lcr_biller_group_member_id else null end) as [standard],
				sum(case when m.[primary] = 1 and m.bill_payment_type_id = 2 then m.lcr_biller_group_member_id else null end) as [next_day],
				sum(case when m.[primary] = 1 and m.bill_payment_type_id = 3 then m.lcr_biller_group_member_id else null end) as [same_day],
				sum(case when m.[primary] = 1 and m.bill_payment_type_id = 1 then m.provider_id else null end) as [standard_provider],
				sum(case when m.[primary] = 1 and m.bill_payment_type_id = 2 then m.provider_id else null end) as [next_day_provider],
				sum(case when m.[primary] = 1 and m.bill_payment_type_id = 3 then m.provider_id else null end) as [same_day_provider]
			 from
				lcr_biller_group_member m with(nolock)
			 group by
				m.lcr_biller_group_id 
			) m on m.lcr_biller_group_id = bg.lcr_biller_group_id

		where 
			a.business_id = @business_id) InnerQuery

	left outer join
		lcr_biller_group_override o with(nolock) on o.lcr_biller_group_override_id = InnerQuery.override_id
	left outer join
		lu_lcr_override_entity_type ot with(nolock) on ot.lcr_override_entity_type_id = InnerQuery.override_entity_type_id

	left outer join
	(select 
		[Biller Key], [Biller Name], 1 as provider_id --RPPS only
	 from 
		rpps_directory_biller with(nolock) 
	  union all
	 select 
		s.bill_payment_service_id as [Biller Key], b.biller_name as [Biller Name], s.bill_payment_processor_id as provider_id
	 from 
		bill_payment_biller_service s with(nolock)
	 inner join 
		bill_payment_biller b with(nolock) on b.bill_payment_biller_id = s.bill_payment_biller_id 
	 where 
		s.bill_payment_type_id = 1
	) rpb on rpb.[Biller Key] = InnerQuery.[standard] and rpb.provider_id = InnerQuery.[standard_provider]

	left outer join
		bill_payment_biller_service bs_next with(nolock) on bs_next.bill_payment_service_id = InnerQuery.[next_day]
	left outer join
		bill_payment_biller bil_next with(nolock) on bil_next.bill_payment_biller_id = bs_next.bill_payment_biller_id
	left outer join
		bill_payment_biller_service bs_same with(nolock) on bs_same.bill_payment_service_id = InnerQuery.[same_day]
	left outer join
		bill_payment_biller bil_same with(nolock) on bil_same.bill_payment_biller_id = bs_same.bill_payment_biller_id
	left outer join
		lu_bill_payment_processor p_standard with(nolock) on p_standard.bill_payment_processor_id = InnerQuery.standard_provider
	left outer join
		lu_bill_payment_processor p_next with(nolock) on p_next.bill_payment_processor_id = InnerQuery.next_day_provider
	left outer join
		lu_bill_payment_processor p_same with(nolock) on p_same.bill_payment_processor_id = InnerQuery.same_day_provider
	where
		InnerQuery.lcr_biller_group_id = @group_id
	) t
	on t.standard_id = wm.lcr_biller_group_member_id
	or t.same_day_id = wm.lcr_biller_group_member_id
	or t.next_day_id = wm.lcr_biller_group_member_id
order by
	wm.bill_payment_type_id
END
GO

-- ============================================================================================
IF  EXISTS (	SELECT * FROM sys.objects 
				WHERE	object_id = OBJECT_ID(N'[dbo].[usp_get_lcr_group_winning_members]') 
				AND		type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_get_lcr_group_winning_members]
GO


IF NOT EXISTS (	SELECT * FROM sys.objects 
				WHERE	object_id = OBJECT_ID(N'[dbo].[usp_get_lcr_group_winning_members]') 
				AND		type in (N'P', N'PC'))
	BEGIN
	EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_get_lcr_group_winning_members] AS' 
	END
GO

-- ============================================================================================
-- Author:		Keith McLoughlin
-- Create date: 7/1/2014
-- Updated By:	Alex Zarenin
-- Update date:	2015-12-30
-- Description:	Gets posting time category winners for given biller group for a specific agent
-- ============================================================================================
-- EXEC [usp_get_lcr_group_winning_members] @business_id = 1907,  @group_id   =  712;
-- ============================================================================================
ALTER PROCEDURE [dbo].[usp_get_lcr_group_winning_members]
(
	@business_id bigint,
	@group_id bigint
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
-------------------------------------------------------------
DECLARE @AgentGroupID   bigint;
SELECT      @AgentGroupID     = g.group_id
from
            group_member      ag    with(nolock) 
      inner join
            [group]                 g     with(nolock) 
                  on    g.group_id = ag.group_id
                  and   g.group_type_id         = 1 
                  and   g.group_category_id = 3 
                  and   g.group_status_id <> 3
where ag.member_id = @business_id;
--------------------------------------------------------------
select
            wm.lcr_biller_group_member_id,
            wm.lcr_biller_group_id,
            wm.biller_id,
            wm.provider_id,
            wm.bill_payment_type_id,
            wm.active,
            [Primary]				= InnerQuery.IsPrimary
from
		lcr_biller_group_member wm with(nolock)
	inner join
		dbo.FN_get_lcr_group_override(@business_id, @group_id, @AgentGroupID)
								InnerQuery
			on	wm.lcr_biller_group_member_id IN	( 
													InnerQuery.[standard], 
													InnerQuery.same_day, 
													InnerQuery.next_day
													)
where
		wm.Active = 1
and		InnerQuery.IsPrimary = 1
order by
		wm.bill_payment_type_id
END
GO

-- ============================================================================================
IF  EXISTS (	SELECT * FROM sys.objects 
				WHERE	object_id = OBJECT_ID(N'[dbo].[usp_get_lcr_group_winning_members_by_account_number]') 
				AND		type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[usp_get_lcr_group_winning_members_by_account_number]
GO

IF NOT EXISTS (	SELECT * FROM sys.objects 
				WHERE	object_id = OBJECT_ID(N'[dbo].[usp_get_lcr_group_winning_members_by_account_number]') 
				AND		type in (N'P', N'PC'))
	BEGIN
	EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_get_lcr_group_winning_members_by_account_number] AS' 
	END
GO


-- ============================================================================================
-- Author:		Alex Zarenin
-- Create date:	2015-12-30
-- Description:	Gets category winners for given biller group for a specific agent with 
--				account number matching biller account mask
-- ============================================================================================
/*
EXEC usp_get_lcr_group_winning_members_by_account_number 
					@business_id	= 1907,  
					@group_id		=  712, 
					@account_number	= '5407510123456789';
*/
-- ============================================================================================
ALTER PROCEDURE [dbo].[usp_get_lcr_group_winning_members_by_account_number]
	(
	@business_id	bigint,
	@group_id		bigint,
	@account_number	varchar(128)
	)
AS
BEGIN
-------------------------------------------------------------
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
-------------------------------------------------------------
	DECLARE @AgentGroupID   bigint;
	SELECT      @AgentGroupID     = g.group_id
	from
				group_member      ag    with(nolock) 
		  inner join
				[group]                 g     with(nolock) 
					  on    g.group_id = ag.group_id
					  and   g.group_type_id         = 1 
					  and   g.group_category_id = 3 
					  and   g.group_status_id <> 3
	where ag.member_id = @business_id;
--------------------------------------------------------------
	with
		Base AS
		(
		select
					wm.lcr_biller_group_member_id,
					wm.lcr_biller_group_id,
					wm.biller_id,
					wm.provider_id,
					wm.bill_payment_type_id,
					wm.active,
					[Primary]				= InnerQuery.IsPrimary,
					Mask					= coalesce(rpps.Mask, non_rpps.mask) 
		from
					lcr_biller_group_member wm with(nolock)
			  inner join
				   dbo.FN_get_lcr_group_override(@business_id, @group_id, @AgentGroupID)
											InnerQuery
					on	wm.lcr_biller_group_member_id IN	( 
															InnerQuery.[standard], 
															InnerQuery.same_day, 
															InnerQuery.next_day
															)
				left outer join
					rpps_directory_biller_mask		rpps		with(nolock)
						on	rpps.[Biller Key]		= InnerQuery.biller_id 
						and InnerQuery.provider_id	= 1
				left outer join
					bill_payment_biller_mask		non_rpps	with(nolock)
						on	non_rpps.bill_payment_service_id	= InnerQuery.biller_id 
						and InnerQuery.provider_id				> 1	
		where
				wm.Active = 1
		),
		BaseMask	AS
			(
			select
					*,
					SearchPat = replace	(
										replace	(
												replace	(
														replace	(
																Mask, 
																'#', 
																'[0-9]'
																), 
														'@', 
														'[0-9A-Z]'
														), 
												'*', 
												'[A-Z]'
												), 
										'!', 
										'[0-9A-Z!$‘+.;>`}“%(),/<?{~#&*-:=_½@]'
										)
			from Base
			),
	Filtered	AS
		(
		select
				*,
				RowNum	= ROW_NUMBER ( ) OVER ( PARTITION BY bill_payment_type_id ORDER BY [primary] DESC, biller_id DESC )

		from
				BaseMask
		where
				@account_number like SearchPat
		)

SELECT
		lcr_biller_group_member_id,
		lcr_biller_group_id,
		biller_id,
		provider_id,
		bill_payment_type_id,
		active,
		[Primary]
		--,Mask
		--,SearchPat
FROM
		Filtered
WHERE
		RowNum = 1
ORDER BY
        bill_payment_type_id;
END
GO

