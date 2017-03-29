alter table [dbo].[password_pattern] drop column [positive_match]

alter table [dbo].[password_pattern] add [reverse_match] [bit] NOT NULL

alter table [dbo].[password_pattern] drop column [description_ui]

alter table [dbo].[password_pattern] add [description_ui] [varchar](150) NULL

alter table [dbo].[password_pattern] drop CONSTRAINT [DF_password_pattern_is_active]
alter table [dbo].[password_pattern] drop CONSTRAINT [DF_password_patter_reverse_match]

go

SET IDENTITY_INSERT [dbo].[password_pattern] ON
INSERT [dbo].[password_pattern] ([password_pattern_id], [password_pattern], [reverse_match], [description], [description_ui], [is_active]) VALUES (1, N'^[\s\S]{8,14}$', 0, N'Between 8 and 14 characters, including whitespaces.', N'Must be between 8 and 14 characters long, inclusive', 1)
INSERT [dbo].[password_pattern] ([password_pattern_id], [password_pattern], [reverse_match], [description], [description_ui], [is_active]) VALUES (2, N'^(?=.*[a-z]).+$', 0, N'Contain at least one lowercase letter', N'Must contain at least one lowercase letter', 0)
INSERT [dbo].[password_pattern] ([password_pattern_id], [password_pattern], [reverse_match], [description], [description_ui], [is_active]) VALUES (3, N'^(?=.*[A-Z]).+$', 0, N'Contain at least one uppercase letter', N'Must contain at least one uppercase letter', 0)
INSERT [dbo].[password_pattern] ([password_pattern_id], [password_pattern], [reverse_match], [description], [description_ui], [is_active]) VALUES (4, N'^(?=.*\d).+$', 0, N'Contain at least one digit', N'Must contain at least one number', 0)
INSERT [dbo].[password_pattern] ([password_pattern_id], [password_pattern], [reverse_match], [description], [description_ui], [is_active]) VALUES (5, N'^(?=.*[\s~`''!@#$%\^&*()_\-+={}[\]|\\:;“‘<>,.?/]).+$', 1, N'No whitespace or special characters: ~`''!@#$%^&*()_-+={}[\]|\:;“‘<>,.?/', N'Includes space or special character: ~`''!@#$%^&*()_-+={}[\]|\:;“‘<>,.?/', 0)
INSERT [dbo].[password_pattern] ([password_pattern_id], [password_pattern], [reverse_match], [description], [description_ui], [is_active]) VALUES (6, N'^((?=.*[A-Z])(?=.*[a-z])(?=.*\d)|(?=.*[A-Z])(?=.*[a-z])(?=.*[\-!.*;$#@])|(?=.*[A-Z])(?=.*\d)(?=.*[\-!.*;$#@])|(?=.*[a-z])(?=.*\d)(?=.*[\-!.*;$#@])).+$', 0, N'Contain 3 of the 4 types: Numbers, Uppercase, Lowercase, Special characters: -!.*;$#@', N'Must contain 3 of the 4 types:
        * Numbers
        * Uppercase Letters
        * Lowercase Letters
        * Special Characters: -!.*;$#@', 1)
INSERT [dbo].[password_pattern] ([password_pattern_id], [password_pattern], [reverse_match], [description], [description_ui], [is_active]) VALUES (7, N'^(?=.*[^a-zA-Z0-9-!.*;$#@]).+$', 1, N'No whitespace or special characters other than: -!.*;$#@', N'Includes space or special characters other than: -!.*;$#@', 1)
SET IDENTITY_INSERT [dbo].[password_pattern] OFF

INSERT [dbo].[password_pattern_use_xref] ([password_pattern_id], [password_pattern_use_id]) VALUES (1, 1)
INSERT [dbo].[password_pattern_use_xref] ([password_pattern_id], [password_pattern_use_id]) VALUES (6, 1)
INSERT [dbo].[password_pattern_use_xref] ([password_pattern_id], [password_pattern_use_id]) VALUES (7, 1)
/****** Object:  Default [DF_password_patter_reverse_match]    Script Date: 12/01/2015 00:49:44 ******/
ALTER TABLE [dbo].[password_pattern] ADD  CONSTRAINT [DF_password_patter_reverse_match]  DEFAULT ((0)) FOR [reverse_match]
GO
/****** Object:  Default [DF_password_pattern_is_active]    Script Date: 12/01/2015 00:49:44 ******/
ALTER TABLE [dbo].[password_pattern] ADD  CONSTRAINT [DF_password_pattern_is_active]  DEFAULT ((1)) FOR [is_active]
GO

select * from password_pattern 

delete password_pattern
