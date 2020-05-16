/*
 Navicat Premium Data Transfer

 Source Server         : 106.15.231.203
 Source Server Type    : SQL Server
 Source Server Version : 12002000
 Source Host           : 106.15.231.203:1433
 Source Catalog        : CloudUserCenter
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 12002000
 File Encoding         : 65001

 Date: 14/04/2020 09:06:40
*/


-- ----------------------------
-- Table structure for tbAcupoint
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[tbAcupoint]') AND type IN ('U'))
	DROP TABLE [dbo].[tbAcupoint]
GO

CREATE TABLE [dbo].[tbAcupoint] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [name] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [findout] varchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [overview] varchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [handle] varchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [IsDelete] int DEFAULT ((0)) NULL,
  [image] varchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [info] varchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [imageUrl] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[tbAcupoint] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'取穴',
'SCHEMA', N'dbo',
'TABLE', N'tbAcupoint',
'COLUMN', N'findout'
GO

EXEC sp_addextendedproperty
'MS_Description', N'概述',
'SCHEMA', N'dbo',
'TABLE', N'tbAcupoint',
'COLUMN', N'overview'
GO

EXEC sp_addextendedproperty
'MS_Description', N'操作',
'SCHEMA', N'dbo',
'TABLE', N'tbAcupoint',
'COLUMN', N'handle'
GO

EXEC sp_addextendedproperty
'MS_Description', N'图片',
'SCHEMA', N'dbo',
'TABLE', N'tbAcupoint',
'COLUMN', N'image'
GO

EXEC sp_addextendedproperty
'MS_Description', N'基本信息',
'SCHEMA', N'dbo',
'TABLE', N'tbAcupoint',
'COLUMN', N'info'
GO

EXEC sp_addextendedproperty
'MS_Description', N'图片url',
'SCHEMA', N'dbo',
'TABLE', N'tbAcupoint',
'COLUMN', N'imageUrl'
GO


-- ----------------------------
-- Records of tbAcupoint
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tbAcupoint] ON
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'5', N'大椎', N'*取俯卧位或坐位低头;*确定后正中线：即在背部中央所作的垂直线;*在后正中线上，可见颈背部交界处椎骨上有一高突;*这一高突能随颈部左右摆动而转动即是第7颈椎棘突;*在第7颈椎棘突下有一凹陷，即为本穴', N'{"specialPoint":"督脉、手足三阳经交会穴","mainill":"*热病*感冒、咳嗽、气喘等外感病症*头痛项强*疟疾*癫狂、小儿惊风*风疹、痤疮*小儿麻痹后遗症、小儿舞蹈病","experience":"*现代常用于治疗感冒、颈椎病、痤疮等。"}', N'{"moxibustion":"*温度：38-52℃，*艾条悬灸时间：10-20min","chirismus":"用手食指中指的指腹按揉此穴","acupuncture":"*向上斜刺0.5-1寸，*温馨提示：针灸需临床证明，请谨慎操作"}', N'0', N'/wwwroot/Acupoint/c689828c-9da0-4d81-9c1a-a9cec0aa84d0.jpg', N'{"belong":"督脉","position":"在正中线上，第七颈椎棘突下凹陷中"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'15', N'中脘', N'*俯卧位；*沿前正中线向下触摸，找出胸骨体与剑突间形成的凹陷，即胸剑联合；*胸剑联合与脐中连线的中点，即为本穴', N'{"specialPoint":"胃募穴","mainill":"*胃痛、腹胀、呃逆、吞酸、黄疸等脾胃之证；*癫狂，失眠，脏躁；*子宫脱垂；","experience":"*现代常用于治疗胃炎、胃痉挛、 胃溃疡、胃下垂、食物中毒、癫痫、精神病、神经衰弱等。配天枢、足三里、内庭主治霍乱吐泻;配足三里主治脘腹胀痛。*《马氏温灸法》:中院的主治已不胜枚举，简言之，灸中脘有清除胃肠瘀滞，开启、强壮，脾胃之效用。肠胃清则五脏六腑之瘀滞有倾泄之途，脾胃健则五脏六腑生化有源。因此中脘实为调理一切慢性病之必要灸穴，急症亦多用。*《针灸资生经》:凡脾疼不可忍，饮食全不进者，皆宜灸。"}', N'{"moxibustion":"*温度：38-52℃，*艾条悬灸时间：10-20min","chirismus":"用手食指中指的指腹按揉此穴","acupuncture":"*直刺1~1.5寸。针刺的方向应该朝下，使针感自上而下。*温馨提示：针灸需临床证明，请谨慎操作"}', N'0', N'/wwwroot/Acupoint/71b70d8b-9943-4712-a5b0-70691fac5301.jpg', N'{"belong":"任脉","position":"在上腹部，前正中线上，当脐中上4寸"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'16', N'足三里', N'*坐位；*同侧手张开，食指第二指关节桡侧缘对准犊鼻穴下缘，小指第二指关节处即是本穴。', N'{"specialPoint":"合穴","mainill":"*胃痛、呕吐、腹胀、便秘等肠胃病证；*心悸、失眠等心脑病症；*乳痛、肠痛等外科疾患；*虚劳诸证，为强壮保健要穴。","experience":"*现代常用于治疗急慢性胃炎、胃或十二指肠溃疡、急慢性胰腺炎、肝炎、消化不良、急慢性肠炎、细菌性痢疾、阑尾炎、休克、神经性头痛、高血压、神经衰弱、精神分裂症、动脉硬化、支气管哮喘、白细胞减少症、下肢瘫疾、坐骨神经痛、膝关节及周围软组织疾患。配中脘、内关主治胃皖痛;配脾俞、气海、肾俞主治虚证腹泻;配三阴交、神门治疗心悸。\n*《马氏温灸法》:不少的古医籍均载:小儿不能灸足三里。认为灸之可妨碍小儿生长及引起目疾等。船《图翼》云:“小儿禁灸三里，三十外方可灸，不尔反生疾”。实则像小儿脾胃不和.泻痢、呕吐、痰喘等症，在灸其它穴时配灸足三里定常可取效的。只走应当注意，小儿不宜像成人一样以足三里做为常规保健穴使用，以免撤热于下，坊碍小儿生长。\n*《针灸资生经》云:诸病皆治。华佗云:疗五劳贏瘦，?七伤虚乏，胸中淤血，乳痛。"}', N'{"moxibustion":"*温度：38-52℃；*艾条悬灸时间：10-20min","chirismus":"自我按摩，用拇指的指腹端轻轻揉按此穴。或握拳用指间关节叩击此处","acupuncture":"*直刺1-2寸。向下放散至脚趾。针尖略向上斜刺，并不断捻转运针。*温馨提示：针刺需要临床证明，请谨慎操作。"}', N'0', N'/wwwroot/Acupoint/e529aeef-3cfc-431a-959d-12eeb9aa0648.jpg', N'{"belong":"足阳明胃经","position":"在小腿前外侧，当犊鼻穴下3寸，距胫骨前缘1中指"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'17', N'神阙', N'*正坐位或俯卧位；*肚脐中央即为本穴', N'{"specialPoint":"无","mainill":"*腹痛、腹泻等肠道病症；*中风脱证；*水肿，小便不利；","experience":"*现代常用于治疗胃炎、肠炎、痢疾、尿潴留等。配关元主治久泄不止、肠鸣腹痛;配重灸关元主治中风脱证。*《马氏温灸法》:使脑溢血昏迷及脑血栓昏迷患者复苏，须长时间灸此穴。慢性病，不论何症，多宜灸此，治急症亦效，以其助护元气尔。*《针灸资生经》:中风不省，急灸脐中皆效。禁针"}', N'{"moxibustion":"*温度：38-52℃；*艾条悬灸时间：10-15min","chirismus":"用手食指中指的指腹按揉此穴","acupuncture":"*禁刺；*温馨提示：针刺需要临床证明，请谨慎操作。"}', N'0', N'/wwwroot/Acupoint/9e2d4f8c-75fe-45fb-b52e-e7435d39c129.jpg', N'{"belong":"任脉","position":"在腹中部，脐中央。"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'18', N'期门', N'*正坐位或俯卧位(女性取仰卧位)；*自乳头垂直向下推2个肋间隙(乳头平第四肋间隙)，按压有酸胀感处，即为本穴。', N'{"specialPoint":"肝之募穴","mainill":"*乳痛；*胸胁胀痛；*腹胀，呃逆，呕吐；*遗尿，肾炎；","experience":"*常用于治疗胆囊炎、胆石症、肝炎、肋间神经痛等。配肝俞、膈俞主治胸胁胀痛;配阳陵泉、中封主治黄疸。*《马氏温灸法》:期门所治甚广，加肝气盛、肝炎、肝硬化、肾炎、腹膜炎、牌肿大、伤寒不解，热入血室及喘息等症。大凡各脏腑有瘀滞，治须调肝者皆宜灸此穴配太冲。"}', N'{"moxibustion":"*温度：38-48℃；*艾条悬灸时间：10-20min","chirismus":"用手食指中指的指腹按揉此穴","acupuncture":"*斜刺或平刺0.5-0.8寸，不可深刺，以免伤及内脏；*温馨提示：针刺需要临床证明，请谨慎操作。"}', N'0', N'/wwwroot/Acupoint/aa2ec208-e877-4fdf-b2dc-493bd29ae77a.jpg', N'{"belong":"足厥阴肝经","position":"在胸部，当乳头直下，第六肋间隙，前正中线旁边4寸"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'19', N'太冲', N'*正坐位或俯卧位；*由第1、2足趾间缝纹头向足背推；*至第1、2跖骨之间跖骨结合部前方，可感有一凹陷处，即为本穴。', N'{"specialPoint":"输穴；原穴","mainill":"*头痛、眩晕等头面五官病症；*中风、小儿惊风；*黄疸、腹胀等肝胃病症；*月经不调，痛经，闭经等妇科证；*遗尿","experience":"*现代常用与治疗脑血管病、高血压、青光眼、面神经麻痹、癫痫、肋间神经病、月经不调、下肢瘫痪等。配合谷称为四关穴，主治头痛、眩晕、小儿惊风、口歪等。"}', N'{"moxibustion":"*温度：38-48℃；*艾条悬灸时间：10-20min","chirismus":"自我按摩，用手食指中指的指腹按揉此穴","acupuncture":"*斜刺或平刺0.5-1寸；*温馨提示：针刺需要临床证明，请谨慎操作。"}', N'0', N'/wwwroot/Acupoint/9b4c7344-237c-471f-bb4f-4435108a0bb2.jpg', N'{"belong":"足厥阴肝经","position":"在足背侧，当第1、2跖骨结合部之前凹陷处"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'20', N'阳陵泉', N'*坐位，屈膝成90度；*在小腿部，膝关节处下方，可见一明显凸起(腓骨小头)；*在该凸起前方可触及一凹陷，即为本穴', N'{"specialPoint":"合穴；胆下合穴；","mainill":"*黄疸、口苦、呕吐等肝胆病症；*下肢痿痹等下肢、膝关节疾患；*肩痛；*高血压；","experience":"*现代常用于治疗胆囊炎、胆石症、肝炎、坐骨神经痛、下肢瘫疾、膝关节病变、肩关节周围炎、肋间神经痛、小儿舞蹈病等。配支沟主治胁肋痛;配日月主治胆囊炎;配环跳、委中、悬钟等主治下肢痿痹。据报道艾灸阳陵泉可使胆囊收缩，胆总管规律性收缩，能促进胆汁分泌，对奥狄括约肌有明显的解痉作用。\n*《马氏温灸法》:感冒，高血压。"}', N'{"moxibustion":"*温度：38-50℃；*艾条悬灸时间：10-20min","chirismus":"自我按摩，用手食指中指的指腹按揉此穴","acupuncture":"*直刺1-1.5寸；*温馨提示：针刺需要临床证明，请谨慎操作。"}', N'0', N'/wwwroot/Acupoint/9b1fce64-d752-43bf-8e7a-836e89251de9.jpg', N'{"belong":"足少阳胆经","position":"在小腿外侧，当腓骨头前下方凹陷处"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'21', N'脾俞', N'*正坐或俯卧位；*取一线过肚脐中点，水平绕腰腹一周;该线与后正中线交点，即为第2腰椎;*从第2腰椎棘突垂直向上推3个椎体,即莢第11胸椎棘突;*在第11胸椎棘突下有一凹陷，此凹陷旁开2横指(食指、中指并拢，以中指近端指间关节村纹水平的二指宽度为1.5寸)，即为本穴。', N'{"specialPoint":"脾之背俞穴","mainill":"*腹胀、腹泻、呕吐、痢疾、便血等脾胃肠腑病证;*背痛;*肾下垂，月经不调，糖尿病，肾炎，小儿夜盲，荨麻疹。","experience":"*现代常用于治疗胃溃疡、胃炎、胃痉挛、神经性呕吐、肠炎等。配中脘、三阴交、足三里主治呕吐;配胃俞、中脘、章门.足三里、关元俞主治泄泻;配肾俞、三阴交主治消渴。"}', N'{"moxibustion":"*温度：38-50℃；*艾条悬灸时间：10-25min","chirismus":"自我按摩，用手食指中指的指腹按揉此穴","acupuncture":"*斜刺0.5-0.8寸。本经背部诸穴，不宜深刺，以免伤及内部重要器官；*温馨提示：针刺需要临床证明，请谨慎操作。"}', N'0', N'/wwwroot/Acupoint/7dd916e5-4450-4df3-97dc-9e65e0eb8b05.jpg', N'{"belong":"足太阳膀胱经","position":"在背部，当第11胸追棘突下，旁开1.5寸"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'22', N'血海', N'*坐位，屈膝成90度；*用左手掌心对准右膝盖骨(髌骨)上缘;*二至五指向上伸直，拇指与其余四指约成45.度斜置，拇指尖下，即为本穴', N'{"specialPoint":"无","mainill":"*月经不调，痛经，经闭等妇科病证;*瘾疹，湿疹，丹毒等血热性皮肤病;*睾丸炎,贫血，下肢溃疡，膝关节炎。","experience":"*现代常用于治疗功能性子宫出血、贫血、荨麻疹、湿疹、皮肤瘙痒、膝关节疼痛等。配带脉主治月经不调;配曲池、合谷主治荨麻疹;配犊鼻、阳陵泉主治膝痛。"}', N'{"moxibustion":"*温度：38-48℃；*艾条悬灸时间：10-20min","chirismus":"自我按摩，用手食指中指的指腹按揉此穴","acupuncture":"*直刺1-1.5寸；*温馨提示：针刺需要临床证明，请谨慎操作"}', N'0', N'/wwwroot/Acupoint/c3917c41-6e34-4544-bfce-6f9f4f55d27c.jpg', N'{"belong":"足太阴脾经","position":"屈膝，在大腿内侧，髌底内侧端上2寸，当股四头肌内侧头的隆起处。"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'23', N'气海', N'*仰卧位或正坐位。从肚脐起沿下腹部前正中线直下量2横指处，即为本穴。', N'{"specialPoint":"无","mainill":"*腹痛、泄泻、便秘等肠腑病证;*遗尿、阳痿、遗精、滑精、月经不调、闭经、崩漏等妇科及前阴病证;*中风脱证、贏瘦无力等气虚病证;*脑血管病，气喘，心下痛，疝气，神经衰弱。","experience":"*现代常用于治疗肠炎、细菌性痢疾、男子性功能障碍、功能性子官出血、支气管哮喘、神经衰弱等。配关元、足三里主治中气下陷;配天枢、上巨虚主治急性痢疾;配膻中、太渊主治气短。\n*《针灸资生经》:治脏气虚意，真气不足，一切气疾久不瘥，皆灸之。"}', N'{"moxibustion":"*温度：38-50℃；*艾条悬灸时间：10-20min","chirismus":"用手食指中指的指腹按揉此穴","acupuncture":"*向下斜刺1-2寸；局部酸胀，孕妇酸胀；*温馨提示：针刺需要临床证明，请谨慎操作。"}', N'0', N'/wwwroot/Acupoint/07a271bd-a230-401d-87a1-cf87d5b23ea1.jpg', N'{"belong":"任脉","position":"在下腹部，前正中线上，当脐中下1.5寸。"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'24', N'中级', N'*仰卧位或正坐位。*确定耻骨联合:沿下腹部前正中线垂直向下推，可触及一骨头，此骨头即为耻骨联合;*将脐中与耻骨联合上缘中点的连线平分为5等分;*该连线的上4/5与下115交点处即为本穴。', N'{"specialPoint":"膀胱募穴，任脉、足三阴经交会穴","mainill":"*痛经、月经病。*子官内膜炎、盆腔炎、膀胱炎;*男子性功能障碍、尿潴留、前列腺炎等。","experience":"*现代常用于治疗痛经、月经病、子官内膜炎、盆腔炎、膀胱炎、男子性功能障碍、尿瀦刀丑、前列腺炎等。配地机、次膠主治痛经;配关元、三阴交主治遗精、阳痿;中极透曲骨,配三阴交、地机主治癃闭。\n*《马氏温灸法》:卵巢肿瘤、睾丸炎、肾炎。"}', N'{"moxibustion":"*温度：38-50℃；*艾条悬灸时间：5-10min","chirismus":"用手食指中指的指腹按揉此穴","acupuncture":"*直刺1-2寸；局部酸胀，可放射至外生殖器及会阴部位。孕妇慎用；*温馨提示：针刺需要临床证明，请谨慎操作。"}', N'0', N'/wwwroot/Acupoint/5e51f150-f87b-419a-b744-509005117dbf.jpg', N'{"belong":"任脉","position":"在下腹部，前正中线上，当脐中下4寸。"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'25', N'风池', N'*仰卧位或正坐位。*在后头骨下两条大筋外缘有两凹陷;*此凹陷大致与耳垂齐平，用力按压有酸胀感，即为本穴。', N'{"specialPoint":"足少阳、阳维脉交会穴。","mainill":"*头痛，眩晕，目赤肿痛、鼻渊、耳鸣等头面五官病证;*中风、不寐、癫痫等神志病证;*颈项强痛;*视网膜出血，视神经萎缩","experience":"*现代常用于治疗高血压、脑动脉硬化、神经衰弱、癫痫、感冒、视神经萎缩、鼻炎、颈椎病等。配大椎、后溪主治颈项强痛;配睛明、太阳、太冲主治目赤肿痛;配上天柱(天柱穴上5分)、足三里、三阴交对突眼症有一定疗效;艾灸风池穴对神经萎缩患者疗效较好。"}', N'{"moxibustion":"*温度：38-50℃；*艾条悬灸时间：5-10min","chirismus":"自我按摩，用手食指中指的指腹按揉此穴","acupuncture":"*针尖微下，向鼻尖斜刺0.8-1.2寸；*温馨提示：针刺需要临床证明，请谨慎操作。"}', N'0', N'/wwwroot/Acupoint/49fbc8ec-ea8d-47aa-8172-3fb50fecab62.jpg', N'{"belong":"足少阳胆经","position":"在颈部，当枕骨之下，与风府相平，胸锁乳突肌与斜方肌上端之间的凹陷处。"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'26', N'合谷', N'*伸臂，拇、食两指张开。*以一手的拇指指间横纹，放在另一手拇、食指之间的指蹼缘上;*屈指，拇指尖所指处，按压有明显酸胀感,即为本穴', N'{"specialPoint":"原穴","mainill":"*头痛，目赤肿痛，鼻衄；*齿痛、(口眼歪斜、耳聋等头面五官疾病;*肢体、内脏等疼痛;*热病、无汗、多汗，经闭;⑤腰扭伤，落枕，腕关节痛;*膈肌痉挛","experience":"*现代常用于治疗面神经麻痹、三叉神经痛、近视眼、牙龈炎、牙痛、感冒、高血压、皮肤病、月经不调等。配颊车、迎香主治牙痛、面痛、面瘫;配列缺、大椎等主治感冒、头痛、发热等;配太冲主治癫狂、头痛、眩晕、高血压等;配三阴交主治月经不调、痛经等。\n*《针灸资生经》:”妇人旺振不可刺，刺损胎气”。"}', N'{"moxibustion":"*温度：38-50℃；*艾条悬灸时间：10-20min","chirismus":"自我按摩，用拇指远端指腹点按合谷穴并上下推理。","acupuncture":"*直刺0.2-1寸，或深透后溪穴。针刺时手呈半握拳状。孕妇不宜针。局部酸胀，或向指端放散；*温馨提示：针刺需要临床证明，请谨慎操作。"}', N'0', N'/wwwroot/Acupoint/81839d11-82a4-4f71-bc05-c3d5965b2cd3.jpg', N'{"belong":"手阳明大肠经","position":"在手背，第1、2掌骨间，当第2掌骨桡侧的中点处"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'27', N'三阴交', N'*正坐或仰卧位。*手4指并拢，小指下边缘紧靠内踝尖上，食指上缘处，小腿内侧骨后方即为本穴', N'{"specialPoint":"足太阴、少阴、蕨阴经交会穴。","mainill":"*月经不调，痛经，崩漏，赤白带下，经闭,癥瘕，阴挺，难产，产后血晕,恶露不尽，久不成孕，梦遗，遗精，阳痿，早泄，阴茎痛，疝气，睾丸缩腹;*遗尿，尿闭，水肿，小便不利:*脾胃虚弱，肠鸣，腹胀，泄泻，足瘘，脚气，肌肉疼痛;*皮肤病，湿疹，荨麻疹;*失眠，头痛头晕，两胁下痛等。","experience":"*现代常用于治疗急慢性肠炎、细菌性痢疾、功能性子宫出血、遗尿、性功能减退、高血压、神经性皮炎、湿疹、神经衰弱、下肢神经痛或瘫疾等。配天枢、合谷等主治急性肠炎;配中极、行间主治月经不调、痛经;配阴陵泉、膀胱俞、中极主治癃闭。\n*《针灸资生经》云:旺振不可刺。"}', N'{"moxibustion":"*温度：38-48℃；*艾条悬灸时间：10-20min","chirismus":"自我按摩，用拇指的指腹端轻轻按揉此穴。","acupuncture":"*直刺1-1.5寸，孕妇禁针；*温馨提示：针刺需要临床证明，请谨慎操作。"}', N'0', N'/wwwroot/Acupoint/3b2a37b6-7a0e-430e-b73f-883889497003.jpg', N'{"belong":"足太阴脾经","position":"在小腿内侧，当足内踝尖上3寸，胫骨内侧缘后方。"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'28', N'曲池', N'*屈肘成45°；*在肘关节的外侧，肘横纹头处，即为本穴', N'{"specialPoint":"合穴","mainill":"*手臂痹痛、上肢不遂等上肢病证;*热病;*高血压;*癫狂;*腹痛、吐泻等肠胃病证;*咽喉肿痛、齿痛等五官疾患;*瘾疹、湿疹、瘰疬等皮、外科病证。","experience":"*现代常用于治疗肩时关节疼痛、上肢瘫痪、高血压、荨麻疹、流行性感冒、扁桃体炎、甲状腺肿大、急性胃肠炎等配合谷、外关等治疗感冒发热、扁桃体炎;配合谷、血海等治疗荨麻疹;配肩鶻、外关等治疗上肢痿痹。\n*《针灸资生经》云:灸大良;日灸七壮，至百壮且停。十余日更下火，至二百罢。"}', N'{"moxibustion":"*温度：40-45℃；*艾条悬灸时间：5-20min","chirismus":"自我按摩，用拇指远端指腹点按该穴。","acupuncture":"*直刺0.5-1.5寸；*温馨提示：针刺需要临床证明，请谨慎操作。"}', N'0', N'/wwwroot/Acupoint/4e9a12bf-c0dd-4d90-865e-3caeccf4d97e.jpg', N'{"belong":"手阳明大肠经","position":"在时横纹外侧端，屈肘，当尺泽与肱骨外上髁连线中点。"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'29', N'大陵', N'*伸臂仰掌，微曲腕握拳；*在手臂内侧可触摸到两条明显条索状筋(掌长肌腱与桡侧腕屈肌腱);*在近掌侧腕横纹中点，两筋之间的凹陷处,即为本穴。', N'{"specialPoint":"输穴，原穴","mainill":"*心痛，心悸，胸胁痛等心胸病证;*癫狂;*胃痛，呕吐，痫证;*腕臂痛;*咽炎，腋淋巴腺炎，疥癣","experience":"*现代常用于治疗心肌炎、神经衰弱、腕关节及周围软组织疾患等。配心俞、巨阙、间使、神门治疗心悸;配曲泽、内关主治心胸痛;配内关、公孙、足三里、中脘主治胃痛"}', N'{"moxibustion":"*温度：38-48℃；*艾条悬灸时间：10-20min","chirismus":"自我按摩，用手拇指或食指的指腹端轻轻揉按此穴。","acupuncture":"*直刺0.3-0.5寸；*温馨提示：针刺需要临床证明，请谨慎操作。"}', N'0', N'/wwwroot/Acupoint/3cbe4b00-54f0-4e83-a723-4790b4059514.jpg', N'{"belong":"手厥阴心包经","position":"在腕掌横纹的中点处，当掌长肌腱与桡侧腕屈肌腱之间"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'30', N'劳宫', N'*握拳屈指；*中指尖所指掌心处，在第二掌横纹稍下方，偏于第3掌骨侧处，按压有酸胀感，即为本穴', N'{"specialPoint":"荥穴","mainill":"*心痛，心悸;*癫狂痫;*口疮,口臭,黄疸，食欲不振;*手癣，手指麻木;*高血压。","experience":"*现代常用于治疗昏迷、中暑、癔病、(Z腔炎等。配水沟、十宣、曲泽、委中治疗中暑昏迷;配金津、玉液、内庭治疗口疮"}', N'{"moxibustion":"*温度：38-50℃；*艾条悬灸时间：5-10min","chirismus":"自我按摩，用手拇指或食指的指腹端轻轻揉按此穴。","acupuncture":"*直刺0.3-0.5寸，为急救穴之一；*温馨提示：针刺需要临床证明，请谨慎操作。"}', N'0', N'/wwwroot/Acupoint/fe0b8f5c-4d03-427d-b200-d0f4f510711c.jpg', N'{"belong":"手厥阴心包经","position":"在手掌心，当第2、3掌骨之间偏于第3掌骨,握拳屈指时中指尖处"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'46', N'天枢', N'*仰卧位；*过乳头作一与前正中线平行的直线；*沿脐中做一水平线；*两线交叉点到脐中连线的中点，即为本穴。', N'{"specialPoint":"大肠募穴","mainill":"*腹痛、腹胀*便秘、腹泻.痢疾等胃肠病证;*月经不调、痛经等妇科疾患;*肾炎","experience":"*现代常用于治疗急慢性胃炎、急慢性肠炎、阑尾炎、肠麻痹、细菌性痢疾、消化不良。配足三里主治消化不良、腹泻;配上巨虚、曲池主治细菌性痢疾;配上巨虚、阑尾穴主治急性阑尾炎;配足三里、大肠俞主治肠麻痹、便秘。\n*《马氏温灸法》:急性肠炎及痢疾，配下脘、气海，往往一灸便愈，亦治肾炎。\n"}', N'{"moxibustion":"*温度：38-52℃；*艾条悬灸时间：15-30min","chirismus":"自我按摩，用食中指的指腹端轻轻轻柔按此穴","acupuncture":"*直刺1~1.5寸。天枢有活。血调经之功效。\n*温馨提示：针刺需要临床证明，请谨慎操作。\n"}', N'0', N'/wwwroot/Acupoint/6fee35e9-420c-481f-a08e-711ea36f8dde.jpg', N'{"belong":"足阳明胃经","position":"在腹中部，脐中旁开2寸。"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'47', N'大肠俞', N'*正坐或俯卧位；*两侧骨盆最高点（髂嵴最高点)连线与后正中线的交点处，为第4腰椎棘突；*在第4腰椎棘突下有一凹陷，此凹陷旁开2横指(食指、中指并拢，以中指近端指间关节横纹水平的二指宽度为1.5寸），即为本穴', N'{"specialPoint":"大肠之背俞穴","mainill":"*腹胀，泄泻，便秘；*腰腿痛；*坐骨神经痛；*遗尿，肾炎","experience":"*现代常用于治疗肠炎、痢疾、痔疮、阑尾炎、坐骨神经痛等。配肾俞、命门、腰阳关、委中主治腰脊强痛；配小肠俞主治二便不利。\n*《马氏温灸法》：肾炎，阑尾炎。\n"}', N'{"moxibustion":"*温度：38-50℃；*艾条悬灸时间：10-15min","chirismus":"自我按摩，用拇指的指腹端揉按此穴","acupuncture":"*直刺0.5~1.2寸。《大成》卷六“‘主脊强不得俯仰，腰痛，腹中气胀，绕脐切痛，多食身瘦\n\n*温馨提示：针刺需要临床证明，请谨慎操作。\n"}', N'0', N'/wwwroot/Acupoint/582975a5-3101-4d19-b1a4-5a2f2d5c926c.png', N'{"belong":"足太阳膀胱经","position":"在腰部，当第4腰椎棘突下，旁开1.5寸"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'48', N'支沟', N'*抬臂，掌心向下；
*从掌腕背横纹中点处直上量4横指（示指、中指、无名指、小指）四指并拢，以中指近端指间关节横纹水平的四指宽度为3寸，也称一夫法）；
*在前臂两骨头之间的凹陷处，按压有酸胀感，即为本穴。
', N'{"specialPoint":"经穴","mainill":"*暴喑，耳聋，耳鸣；*胁肋痛；*便秘；*瘰疬；*心绞痛，心肌炎。","experience":"*临床常用于治疗习惯性便秘、肋间神经痛、急性腰扭伤等。配阳陵泉、外关治疗胸胁疼痛；配足三里、天枢治疗便秘；配阳池、八邪主治手指震颤。"}', N'{"moxibustion":"*温度：38-48℃；*艾条悬灸时间：10-20 min","chirismus":"自我按摩，用手拇指或食指的的指腹端揉按此穴","acupuncture":"*直刺0.5~1.2寸。\n\n*温馨提示：针刺需要临床证明，请谨慎操作。\n"}', N'0', N'/wwwroot/Acupoint/269547c3-c864-4e40-8f82-af4eb8a2d53c.jpg', N'{"belong":"手少阳三焦经","position":"在前臂背侧，当阳池与肘尖的连线上，腕背横纹上3寸，尺骨与桡骨之间。"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'49', N'大横', N'*仰卧位；
*过乳头作一与前正中线平行的直线；
*沿脐中作一水平线；
*两线的交点，即为本穴
', N'{"specialPoint":"足太阴、阴维脉交会穴","mainill":"*腹痛、腹泻、便秘等胃肠病证；*四肢痉挛，流行性感冒。","experience":"*现代常用于治疗急慢性肠炎、细菌性痢疾、习惯性便秘、肠麻痹、肠道寄生虫等。配天枢、中脘、足三里主治腹痛、腹泻；配四缝或足三里主治肠道寄生虫病。\n*《马氏温灸法》：治大便不通只灸左侧大横，并配双侧承山穴，一般晚间灸，次日晨便下。\n"}', N'{"moxibustion":"温度：38-50℃；*艾条悬灸时间：10-20 min","chirismus":"自我按摩，用拇指的指腹端揉按此穴","acupuncture":"*直刺1-2寸。\n\n*温馨提示：针刺需要临床证明，请谨慎操作。\n"}', N'0', N'/wwwroot/Acupoint/6134bcf6-15ce-4399-b990-1d0325b3189f.png', N'{"belong":"足太阴脾经","position":"仰卧，在腹中部，距脐中4寸。"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'50', N'腹结', N'*站立位或仰卧位。*从大横（参见“大横”）沿垂直线向下量1.3寸（拇指1横指为1寸）', N'{"specialPoint":"无","mainill":"*腹痛、腹泻、疝气。","experience":"*现代常用于治疗胃肠炎、细菌性痢疾等。配天枢、足三里主治腹痛、腹泻；配行间主治腹痛、胃痛。\n*《马氏温灸法》：阑尾炎\n"}', N'{"moxibustion":"*温度：38-48℃；*艾条悬灸时间：5-10 min","chirismus":"自我按摩，用拇指的指腹端揉按此穴","acupuncture":"*直刺1-2寸。\n\n*温馨提示：针刺需要临床证明，请谨慎操作。\n"}', N'0', N'/wwwroot/Acupoint/19767522-e113-4ab2-a6a5-32db9656dc29.png', N'{"belong":"足太阴脾经","position":"在下腹部，大横下1.3寸，距前正中线4寸"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'51', N'梁丘', N'*正坐屈膝；
*从膝盖骨（髌骨）外侧最高点，垂直往上量2横指（大拇指指间关节部位的横径为1寸）；
*下肢用力蹬直时，在膝盖骨（髌骨）外上缘上方可触及一凹陷；
*此凹陷中点，即为本穴。
', N'{"specialPoint":"郄穴","mainill":"*腹泻，急性胃痛；*膝肿痛，下肢不遂等下肢病证；*乳痈、乳痛等乳疾。","experience":"*现代常用于治疗胃痉挛、乳腺炎、膝关节病变等。配中脘、内关、足三里主治急性胃痛；配犊鼻、阳陵泉、膝阳关主治膝关节痛。"}', N'{"moxibustion":"*温度：38-48℃；*艾条悬灸时间：10-20min","chirismus":"自我按摩，用拇指的指腹端轻轻揉按此穴。或握拳用指间关节叩击此处","acupuncture":"*直刺1-2寸。\n*温馨提示：针刺需要临床证明，请谨慎操作。\n"}', N'0', N'/wwwroot/Acupoint/74772c4f-dbb7-47ac-9efc-0558b8439ab4.png', N'{"belong":"足阳明胃经","position":"屈膝，在大腿前面，当髂前上棘与髌底外侧端的连线上，髌底上2寸"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'52', N'外关', N'*抬臂，掌心向下；
*从掌腕背横纹中点处直上量2横指（大拇指指间关节部位的横径为1寸）；
*在前臂两骨头之间的凹陷处，按压有酸胀感，即为本穴。
', N'{"specialPoint":"络穴；八脉交会穴（通于阳维脉）","mainill":"*头痛，颊痛，目赤肿痛，耳鸣，耳聋，喉痹等头面五官疾患；*热病；*胁肋痛，上肢痹痛；*瘰疬。","experience":"*临床常用于治疗偏头痛、高热、神经性耳聋、肋间神经痛、落枕、急性腰扭伤等。配太阳、率谷主治偏头痛；配足临泣治疗耳聋、目痛、颊肿、项强、肩痛；配后溪主治落枕；配阳池、中渚主治手指疼痛、腕关节疼痛。"}', N'{"moxibustion":"*温度：38-48℃；*艾条悬灸时间：5-10min","chirismus":"自我按摩，用拇指或食指的指腹端轻轻揉按此穴。或握拳用指间关节叩击此处","acupuncture":"*直刺1-1.5寸。\n*温馨提示：针刺需要临床证明，请谨慎操作。\n"}', N'0', N'/wwwroot/Acupoint/7a9aabfd-9452-400a-adba-49a6b1c56cc3.jpg', N'{"belong":"手少阳三焦经","position":"在前臂背侧，当阳池与肘尖的连线上，腕背横纹上2寸，尺骨与桡骨之间。"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'53', N'气舍', N'*正坐或仰卧位。
*用力侧转头，可见颈部明显隆起的胸锁乳突肌
*在胸锁乳突肌的胸骨头、锁骨头和锁骨根部围成的凹陷中
*按压有痛感处，即为本穴。
', N'{"specialPoint":"无","mainill":"*咽喉肿痛；*瘿瘤，瘰疬；*气喘，呃逆，咳嗽；*颈项强痛。","experience":"*现代常用于治疗甲状腺肿大、支气管炎等。配扶突、人迎主治瘿瘤。"}', N'{"moxibustion":"*温度：38-48℃；*艾条悬灸时间：10-15min","chirismus":"自我按摩","acupuncture":"*直刺0.3-0.5寸。\n*温馨提示：针刺需要临床证明，请谨慎操作。\n"}', N'0', N'/wwwroot/Acupoint/73faba53-6dcb-47ac-a5d2-3c27a4b6269f.png', N'{"belong":"足阳明胃经","position":"在颈部，当锁骨内侧端的上缘，胸锁乳突肌的胸骨头与锁骨头之间"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'54', N'百会', N'*正坐或仰卧位；
*两耳尖与头正中线相交处，即为本穴
', N'{"specialPoint":"督脉、足太阳经交会穴","mainill":"*眩晕，头痛等肝阳上亢诸证；*中风，癫狂；*健忘、不寐、痴呆等心脑病证；*脱肛、泄泻、阴挺等中气下陷诸证","experience":"*现代常用于治疗高血压、美尼尔综合征、老年性痴呆、脑血管病、癫痫、精神分裂症、血管（神经）性头痛、神经衰弱、内脏下垂等。配脑空、天柱主治头风、眼花；配承山、长强主治脱肛、痔疾；配脾俞主治久泻滑脱下陷。\n*《马氏温灸法》：漫性病患者的体质多为下寒上热、下虚上实， 猝灸百会等头部穴，某些患者可出现头晕、口干、耳鸣等反应，故一般宜先灸身体中下部穴，使邪热下行，然后再灸百会等头部穴则无不良反应，且必觉头脑轻松。\n"}', N'{"moxibustion":"*温度：38-48℃；*艾条悬灸时间：10-20min","chirismus":"用手食指中指的指腹揉按此穴","acupuncture":"*平刺0.5-0.8寸。\n*温馨提示：针刺需要临床证明，请谨慎操作。\n"}', N'0', N'/wwwroot/Acupoint/c4fbfd9c-b8b4-4dfd-bf65-0fc617fdcf1f.jpg', N'{"belong":"督脉","position":"在头部，当前发际正中直上5寸，或头顶正中线与两耳尖连线的交点处"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'55', N'关元', N'*仰卧位或正坐位；
*确定耻骨联合：沿下腹部前正中线垂直向下推，可触及一骨头，此骨头即为耻骨联合；
*将脐中与耻骨联合上缘中点的连线平分为5等分；
*该连线的上3/5与下2/5交点处即为本穴
', N'{"specialPoint":"小肠募穴，任脉、足三阴经交会穴","mainill":"*遗精、阳痿、早泄、尿闭、尿频等泌尿生殖系病证；*月经不调、带下、痛经等妇科病证；*中风脱证、虚劳冷惫、羸瘦无力等元气虚损病证；*腹痛、泄泻、痢疾、脱肛等肠腑病证","experience":"*现代常用于治疗男子性功能障碍、尿潴留、肾炎、膀胱炎、前列腺炎、功能性子宫出血、阴道炎、遗尿、低血压、神经衰弱、肠炎等。配中极、百会、三阴交主治遗尿；配肾俞、气海主治肾虚尿频；配肾俞、足三里、三阴交、然谷主治男子不育症；配肾俞、太溪主治久痢。\n*《名堂》云：若怀胎必不针，若针而胎落，胎多不出。岐伯云：但是积冷虚乏皆宜灸。\n"}', N'{"moxibustion":"*温度：38-52℃；*艾条悬灸时间：10-20min","chirismus":"用手食指中指的指腹揉按此穴","acupuncture":"*向下斜刺1.5-2寸。\n*温馨提示：针刺需要临床证明，请谨慎操作。\n"}', N'0', N'/wwwroot/Acupoint/33afb584-7c65-444a-863b-a8ca678bd6f6.png', N'{"belong":"任脉","position":"在下腹部，前正中线上，当脐中下3寸。"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'56', N'太白', N'*正坐垂足或仰卧。
*在足大趾与足掌所构成的关节（第1跖趾关节）后下方掌背交界线处可触及一凹陷，按压有酸胀感，即为本穴。
', N'{"specialPoint":"输穴，原穴","mainill":"*肠鸣、腹胀、腹泻、胃痛、便秘等脾胃病证；*体重节痛","experience":"*现代常用于治疗急慢性胃炎、急慢性肠炎、神经性呕吐、消化不良等。配公孙、大肠俞主治肠鸣、腹泻；配复溜、足三里主治腹胀。"}', N'{"moxibustion":"*温度：38-52℃；*艾条悬灸时间：10-20min","chirismus":"自我按摩，用拇指的指腹揉按此穴","acupuncture":"*直刺0.5-0.8寸。\n*温馨提示：针刺需要临床证明，请谨慎操作。\n"}', N'0', N'/wwwroot/Acupoint/c9ac92ea-79ca-42c4-be1d-99abd1ae8b97.png', N'{"belong":"足太阴脾经","position":"在足内侧缘，当足大趾本节（第1跖趾关节）后下方赤白肉际凹陷处"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'57', N'会阳', N'*俯卧或跪伏位。
*下髎下，尾骨下端旁软陷处，即为本穴。
', N'{"specialPoint":"无","mainill":"*痔疾、腹泻；*阳痿；*带下。","experience":"*现代常用于治疗前列腺炎、肠炎、痔疮等。配百会、长强主治脱肛、痔疮。"}', N'{"moxibustion":"*温度：38-48℃；*艾条悬灸时间：10-15min","chirismus":"自我按摩，用拇指的指腹揉按此穴","acupuncture":"*直刺0.5-0.8寸。\n*温馨提示：针刺需要临床证明，请谨慎操作。\n"}', N'0', N'/wwwroot/Acupoint/d181a732-d2c2-44e6-9ed3-d6862bae5110.png', N'{"belong":"足太阳膀胱经","position":"在骶部，尾骨端旁开0.5寸。"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'58', N'少泽', N'*俯掌伸指。
*沿手小指指甲底部与小指尺侧缘引线（即掌背交界线，或称赤白肉际处）的交点处，距指甲角约0.1寸，即为本穴
', N'{"specialPoint":"井穴","mainill":"*乳痈、乳汁少等乳疾；*昏迷、热病等急证、热证；*头痛、目翳、咽喉肿痛等头面五官病证。","experience":"*现代常用于治疗乳腺炎、乳汁分泌不足、神经性头痛、中风昏迷、精神分裂症等。配肩井、膻中主治产后缺乳；配人中主治热病、昏迷、休克。"}', N'{"moxibustion":"*温度：-℃；*艾条悬灸时间：5-10 min","chirismus":"自我按摩，用拇指的指腹掐按此穴","acupuncture":"*浅刺0.1寸或点刺出血。孕妇慎用\n*温馨提示：针刺需要临床证明，请谨慎操作。\n"}', N'0', N'/wwwroot/Acupoint/2fb71969-1c2c-473d-b454-84ab77b0eb36.png', N'{"belong":"手太阳小肠经","position":"在手小指末节尺侧，距指甲角旁0.1寸"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'59', N'膻中', N'*仰卧位或正坐位；
*确定前正中线：前正中线是指胸骨正前方正中的一条垂直线；
*两乳头连线与前正中线的交点，即为本穴。
', N'{"specialPoint":"心包募穴；八会穴之气会","mainill":"*胸闷、胸痛、心悸、心烦、咳嗽、气喘等心肺部病证；*乳少，乳痈；*呕吐，呃逆。","experience":"*现代常用于治疗支气管哮喘、支气管炎、心绞痛、冠心病、胸膜炎、肋间神经痛、乳腺炎等。配定喘、天突主治哮喘；配心俞、内关主治心绞痛；配百会、气海主治气虚；配少泽、乳根、足三里主治乳汁过少。\n*《马氏温灸法》：肺结核，产后乳汁不下及乳疮。\n"}', N'{"moxibustion":"*温度：38-50℃；*艾条悬灸时间：5-10 min","chirismus":"用手食指中指的指腹揉按此穴","acupuncture":"*平刺0.3-0.5寸\n*温馨提示：针刺需要临床证明，请谨慎操作。\n"}', N'0', N'/wwwroot/Acupoint/27a0fce1-c8c5-462e-9354-6018483cf430.png', N'{"belong":"任脉","position":"在胸部，当前正中线上，平第4肋间，两乳头连线的中点。"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'60', N'乳根', N'*正坐或仰卧位；
*从乳头沿乳中线（过乳头的垂直线）向下推1个肋间隙（即第5肋间隙），按压有酸胀感处，即为本穴。
', N'{"specialPoint":"无","mainill":"*乳痈、乳癖、乳汁少等乳部疾患；*咳嗽，气喘，呃逆；*胸痛。","experience":"*现代常用于治疗乳腺炎、乳汁缺乏、肋间神经痛、支气管炎等。配少泽、足三里主治产后乳汁不足。"}', N'{"moxibustion":"*温度：38-45℃；*艾条悬灸时间：10-20 min","chirismus":"自我按摩，用食中指的指腹端轻轻揉按此穴","acupuncture":"*向外斜刺0.5-0.8寸\n*温馨提示：针刺需要临床证明，请谨慎操作。\n"}', N'0', N'/wwwroot/Acupoint/c47752d9-6b63-4cae-b714-5d63a3febaf0.png', N'{"belong":"足阳明胃经","position":"在胸部，当乳头直下，乳房根部，第5肋间隙，距前正中线4寸。"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'61', N'膺窗', N'*正坐或仰卧位；
*从乳头沿乳中线（过乳头的垂直线）向上推1个肋间隙（即第3肋间隙），按压有酸胀感处，即为本穴。
', N'{"specialPoint":"无","mainill":"*咳嗽、气喘；*胸胁胀痛、肋间神经痛；*乳痈。","experience":"*现代常用于治疗支气管炎、支气管哮喘、乳腺炎、肋间神经痛。配乳根、曲池、内关主治乳腺炎。\n*《马氏温灸法》：治各种乳腺病，包括乳腺癌。\n"}', N'{"moxibustion":"*温度：38-45℃；*艾条悬灸时间：5-10 min","chirismus":"自我按摩，用食中指的指腹端轻轻揉按此穴","acupuncture":"*斜刺或平刺0.5~0. 8寸。\n*局部胀痛。膺窗穴有理气活血，降逆平喘之功效，莢治疗乳房肿痛的主穴之一，同事也处治疗心肺疾患的常用穴位之一。\n*温馨提示：针刺需要临床证明，请谨慎操作。\n"}', N'0', N'/wwwroot/Acupoint/29761882-f734-4811-bc63-7835a373d6bf.png', N'{"belong":"足阳明胃经","position":"在胸部，当第3肋间隙，距前正中线4寸。"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'62', N'行间', N'*坐位或仰卧位；
*在足背侧，第1、2趾两趾之间连接处的缝纹头，按压有凹陷处，即为本穴
', N'{"specialPoint":"荥穴","mainill":"*中风、癫痫、头痛、目眩、目赤肿痛、青盲、口歪等肝经风热所致病证；*月经不调，痛经，崩漏，带下等妇科病证；*遗尿、癃闭等泌尿系病证；*疝气；胸胁胀痛。","experience":"*现代常用于治疗高血压、青光眼、结膜炎、睾丸炎、功能性子宫出血、肋间神经痛等。配耳尖、太阳主治目赤肿痛。"}', N'{"moxibustion":"*温度：38-45℃；*艾条悬灸时间：5-10 min","chirismus":"自我按摩，用手食指或中指的指腹端揉按此穴。","acupuncture":"*斜刺0.5-0.8寸。\n*温馨提示：针刺需要临床证明，请谨慎操作。\n"}', N'0', N'/wwwroot/Acupoint/8c11b009-b570-401a-b191-3c99ca5e46d0.png', N'{"belong":"足厥阴肝经","position":"在足背侧，当第1、2趾间，趾蹼缘的后方赤白肉际处。"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'63', N'肝俞', N'*俯卧位或正坐位；
*在上臂自然下垂时贴于胸侧壁时确定肩胛下角；
*从两侧肩胛下角连线与后正中线相交处所在椎体为第7胸椎；
*从第7胸椎棘突垂直向下推2个椎体棘突即是第9胸椎棘突；
*在第9胸椎棘突下有一凹陷，此凹陷旁开2横指(食指、中指并拢，以中指近端指间关节横纹水平的二指宽度为1.5寸），即为本穴。
', N'{"specialPoint":"肝之背俞穴","mainill":"*胁痛胀痛、黄疸；*癫狂痫；*脊背痛；*淋巴结结核，月经不调。","experience":"*现代常用于治疗急慢性肝炎、胆囊炎、结膜炎、夜盲症、近视等。配太冲主治胁肋疼痛；\n*《马氏温灸法》：痈疮，美尼尔氏综合症。\n"}', N'{"moxibustion":"*温度：38-50℃；*艾条悬灸时间：10-15 min","chirismus":"自我按摩，用手食指或中指的指腹端揉按此穴。","acupuncture":"*斜刺0.5-0.8寸\n*温馨提示：针刺需要临床证明，请谨慎操作。\n"}', N'0', N'/wwwroot/Acupoint/76bf6916-89f3-437d-a406-556d2df1dfbf.png', N'{"belong":"足太阳膀胱经","position":"在背部，第9胸椎棘突下，旁开1.5寸"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'64', N'神门', N'*伸肘仰掌，用力握拳；
*在手前臂内侧可触摸到一条大筋（尺侧腕屈肌腱）；
*在近掌侧腕横纹上，此筋的内侧，即为本穴。
', N'{"specialPoint":"输穴，原穴","mainill":"*心痛、心烦、惊悸、怔仲、健忘、失眠、痴呆、悲哭、癫狂痫等心与神志病证；*高血压；*胸胁痛。","experience":"*现代常用于治疗心绞痛、无脉症、神经衰弱、癔病、精神分裂症等。配支正主治健忘、失眠、无脉症；配大椎、丰隆主治癫狂。\n*《马氏温灸法》：甲状腺肿大。\n"}', N'{"moxibustion":"*温度：-℃；*艾条悬灸时间：10-15 min","chirismus":"自我按摩，用拇指的指腹端轻轻揉按此穴","acupuncture":"*直刺0.3-0.5寸\n*温馨提示：针刺需要临床证明，请谨慎操作。\n"}', N'0', N'/wwwroot/Acupoint/381dd953-6951-4635-a28a-c79b657e50b4.jpg', N'{"belong":"手少阴心经","position":"在腕部，腕掌侧横纹尺侧端，尺侧腕屈肌腱的桡侧凹陷处。"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'65', N'阴陵泉', N'*正坐屈膝或仰卧位；
*用拇指沿小腿内侧骨内缘（胫骨内缘）由下往上推，至拇指抵膝关节时，在小腿内侧骨（胫骨）向上弯曲处可触及一凹陷，即为本穴。', N'{"specialPoint":"合穴","mainill":"*腹胀、腹泻、水肿、黄疸、小便不利等脾不运化水湿病证；*膝痛，下肢麻痹；*失眠。","experience":"*现代常用于治疗急慢性肠炎、细菌性痢疾、尿潴留、尿失禁、尿路感染、阴道炎、膝关节及周围软组织疾患。配足三里、上巨虚主治腹胀、腹泻；配中极、膀胱俞、三阴交主治小便不利。"}', N'{"moxibustion":"*隔物灸仪艾灸时间：30-60分钟；*温度：38-48℃；\n*艾条悬灸时间：10-20分钟；\n*艾炷灸时间：5-9壮。\n","chirismus":"自我按摩，用拇指的指腹端轻轻揉按此穴","acupuncture":"*直刺1-1.5寸\n*温馨提示：针刺需要临床证明，请谨慎操作。\n"}', N'0', N'/wwwroot/Acupoint/23e3670c-0b1b-4198-ba62-32a7c49c1c04.png', N'{"belong":"足太阴脾经","position":"在小腿内侧，当胫骨内侧髁后下方凹陷处。"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'66', N'隐白', N'*正坐垂足或仰卧。
*在足大趾内侧，由足大趾趾甲内侧缘（即掌背交界线，又称赤白肉际）与下缘各作一垂线之交点处，即为本穴。
', N'{"specialPoint":"井穴","mainill":"*月经过多，崩漏等妇科病证；*便血、尿血等慢性出血证；*癫狂、多梦等神志疾患；*惊风；*腹满，暴泻。","experience":"*现代常用于治疗功能性子宫出血、上消化道出血、急性肠炎、精神分裂症、神经衰弱等。配气海、血海、三阴交主治月经过多；配脾俞、上脘、肝俞主治吐血；配大敦治疗昏厥。\n*《针灸资生经》云：妇人月事过时不止，刺立愈。\n"}', N'{"moxibustion":"*温度：-℃；*艾条悬灸时间：5-20min","chirismus":"自我按摩，用拇指的指腹端轻轻揉按此穴","acupuncture":"*浅刺0.1寸\n*温馨提示：针刺需要临床证明，请谨慎操作。\n"}', N'0', N'/wwwroot/Acupoint/942ad689-e5bb-4547-a316-0673c0ade624.png', N'{"belong":"足太阴脾经","position":"在足大趾末节内侧，距趾甲角0.1寸"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'67', N'阴交', N'*仰卧位或正坐位；
*确定耻骨联合：沿下腹部前正中线垂直向下推，可触及一骨头，此骨头即为耻骨联合；
*将脐中与耻骨联合上缘中点的连线平分为5等分；
*该连线的上1/5与下4/5交点处即为本穴。
', N'{"specialPoint":"任脉、冲脉交会穴","mainill":"*腹痛，泄泻，水肿，肠炎、前列腺炎等；*月经不调，带下。","experience":"*现代常用于治疗肠炎、前列腺炎等。配行间主治痞气、肠鸣腹痛；配石门、委阳主治小便不通、小腹硬痛。"}', N'{"moxibustion":"*隔物灸仪艾灸时间：30-70分钟；*温度：38-50 ℃；\n*艾条悬灸时间：10-20分钟；\n*艾炷灸时间：5-7壮。\n","chirismus":"用手食指中指的指腹揉按此穴","acupuncture":"*直刺0.5-1寸，局部酸胀，或向下斜刺2-3寸， \n*温馨提示：针刺需要临床证明，请谨慎操作。\n"}', N'0', N'/wwwroot/Acupoint/91e1098b-f5e5-4aa4-9620-95b6bae1eb7e.png', N'{"belong":"任脉","position":"*在下腹部，前正中线上，当脐中下1寸。"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'68', N'子宫', N'*仰卧位；
*确定前正中线：前正中线是指胸骨正前方正中的一条垂直线；
*确定耻骨联合：沿下腹部前正中线垂直向下推，可触及一骨头，此骨头即为耻骨联合；
*：从耻骨联合上缘中点沿前正中线垂直往上量1横指（大拇指指间关节部位的横径为1寸），即为中极穴；
*从中极穴左、右旁开4横指（示指、中指、无名指、小指四指并拢，以中指近端指间关节横纹水平的四指宽度为3寸，也称一夫法），即为本穴。
', N'{"specialPoint":"无","mainill":"*阴挺、痛经、崩漏、不孕、月经不调等妇科病证。","experience":"*阴挺、痛经、崩漏、不孕、月经不调等妇科病证。"}', N'{"moxibustion":"*隔物灸仪艾灸时间：30-70分钟；*温度：38-52 ℃；\n*艾条悬灸时间：10-20分钟；\n*艾炷灸时间：5-9壮。\n【经验应用】\n","chirismus":"自我按摩","acupuncture":"*直刺0.8-1.2寸\n*温馨提示：针刺需要临床证明，请谨慎操作。\n"}', N'0', N'/wwwroot/Acupoint/fc27645d-c901-4cba-bb26-2e0c93fe3d12.png', N'{"belong":"经外奇穴","position":"在下腹部，当脐中下4寸，中极旁开3寸。"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'69', N'曲骨', N'*仰卧位；
*确定前正中线：前正中线是指胸骨正前方正中的一条垂直线；
*确定耻骨联合：沿下腹部前正中线垂直向下推，可触及一骨头，此骨头即为耻骨联合；
*此耻骨联合的上缘中点处即为本穴。
', N'{"specialPoint":"任脉、足厥阴经交会穴","mainill":"*尿潴留、子宫内膜炎、盆腔炎、前列腺炎等；*月经不调、痛经、带下等妇科病证。","experience":"*现代常用于治疗尿潴留、子宫内膜炎、盆腔炎、前列腺炎等。配三阴交主治癃闭；配急脉、归来主治阳痿、遗精。\n*《马氏温灸法》：治妇科各种病，如子宫下垂、子宫肌瘤等，亦治尿频\n"}', N'{"moxibustion":"*隔物灸仪艾灸时间：30-70 分钟；*温度：38-50 ℃；\n*艾条悬灸时间：5-10分钟；\n*艾炷灸时间：5-9壮。\n","chirismus":"用手食指中指的指腹揉按此穴","acupuncture":"*直刺1-1.5寸；孕妇慎重\n*温馨提示：针刺需要临床证明，请谨慎操作。\n"}', N'0', N'/wwwroot/Acupoint/a5cec97a-36a9-4b09-b364-6518b5b54a41.png', N'{"belong":"任脉","position":"在下腹部，当前正中线上，耻骨联合上缘的中点处。"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'70', N'照海', N'*坐位垂足或仰卧位；
*由内踝尖垂直向下推，至其下缘凹陷处，即为本穴。
', N'{"specialPoint":"八脉交会穴（通于阴跷脉）","mainill":"*痫证、失眠等精神、神志疾患；*咽干咽痛、目齿肿痛等五官热性病证；*小便不利，小便频数；*月经不调、痛经、赤白带下等妇科病证；*下肢痿痹。","experience":"*现代常用于治疗尿道炎、肾炎、神经衰弱、癫痫、月经不调、功能性子宫出血等。配列缺主治咽喉肿痛；配中极、三阴交主治癃闭；配肾俞、关元、三阴交主治月经不调。\n*《马氏温灸法》：高血压、半身不遂、关节炎、便秘、小便不利、水肿、癫痫昼发及夜发均可用。\n"}', N'{"moxibustion":"*隔物灸仪艾灸时间：30-50分钟；*温度：38-48℃；\n*艾条悬灸时间：5-10分钟；\n*艾炷灸时间：3-5壮。\n","chirismus":"自我按摩，用手拇指或食指的指腹端轻轻揉按此穴","acupuncture":"*直刺0.3-0.5寸，局部麻胀\n*温馨提示：针刺需要临床证明，请谨慎操作。\n"}', N'0', N'/wwwroot/Acupoint/80399a5b-8d85-4f65-a705-8b7db12754fc.png', N'{"belong":"足少阴肾经","position":"在足内侧，内踝尖下方凹陷处。"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'71', N'承山', N'*俯卧或侧卧位；
*取腘横纹中点与外踝尖连线中点处，即为本穴。
', N'{"specialPoint":"无","mainill":"*痔疮，便秘，脱肛；*腰腿拘急疼痛；*小儿惊风；*痛经。","experience":"*现代常用于治疗坐骨神经痛、腓肠肌痉挛、痔疮、脱肛等。配环跳、阳陵泉主治下肢痿痹；配长强、百会、二白治疗痔疾。\n*《马氏温灸法》：治便秘，左大横双承山\n"}', N'{"moxibustion":"*隔物灸仪艾灸时间：30-50min；*温度：38-45℃；\n*艾条悬灸时间：10-15min；\n*艾炷灸时间：5-7壮。\n","chirismus":"用拇指的指腹端揉按此穴","acupuncture":"*直刺1-2寸\n*温馨提示：针刺需要临床证明，请谨慎操作\n"}', N'0', N'/wwwroot/Acupoint/3e4f7ad1-e438-44c0-82be-bc7ed65c098f.png', N'{"belong":"足太阳膀胱经","position":"在小腿后面正中，委中与昆仑之间，当伸直小腿或足跟上提时，腓肠肌肌腹下出现尖角凹陷处。"}', NULL)
GO

INSERT INTO [dbo].[tbAcupoint] ([id], [name], [findout], [overview], [handle], [IsDelete], [image], [info], [imageUrl]) VALUES (N'72', N'长强', N'*仰卧屈膝；
*在尾骨端下，尾骨端与肛门连线的中点，即为本穴。
', N'{"specialPoint":"络穴，督脉、足少阳、足少阴经交会穴","mainill":"*痔疾、脱肛、便秘、泄泻等肠腑病证；*癫痫，腰脊及尾骶部疼痛。","experience":"*现代常用于治疗痔疮、癫痫、癔病等"}', N'{"moxibustion":"*隔物灸仪艾灸时间：30-70min；*温度：38-50 ℃；\n*艾条悬灸时间：5-10min。\n","chirismus":"自我按摩","acupuncture":"*紧靠尾骨前面斜刺0.8-1寸。不宜直刺，以免伤及直肠\n*温馨提示：针刺需要临床证明，请谨慎操作。\n"}', N'0', N'/wwwroot/Acupoint/a0b74579-f393-4c62-b19e-176d9cf2ec45.png', N'{"belong":"督脉","position":"在尾骨端下，当尾骨端与肛门连线的中点处。"}', NULL)
GO

SET IDENTITY_INSERT [dbo].[tbAcupoint] OFF
GO


-- ----------------------------
-- Table structure for tbFood
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[tbFood]') AND type IN ('U'))
	DROP TABLE [dbo].[tbFood]
GO

CREATE TABLE [dbo].[tbFood] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [name] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [image] varchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [material] varchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [method] varchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [act] varchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [IsDelete] int DEFAULT ((0)) NULL,
  [imageUrl] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[tbFood] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'原料',
'SCHEMA', N'dbo',
'TABLE', N'tbFood',
'COLUMN', N'material'
GO

EXEC sp_addextendedproperty
'MS_Description', N'做法',
'SCHEMA', N'dbo',
'TABLE', N'tbFood',
'COLUMN', N'method'
GO

EXEC sp_addextendedproperty
'MS_Description', N'功效',
'SCHEMA', N'dbo',
'TABLE', N'tbFood',
'COLUMN', N'act'
GO

EXEC sp_addextendedproperty
'MS_Description', N'图片url',
'SCHEMA', N'dbo',
'TABLE', N'tbFood',
'COLUMN', N'imageUrl'
GO


-- ----------------------------
-- Records of tbFood
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tbFood] ON
GO

INSERT INTO [dbo].[tbFood] ([id], [name], [image], [material], [method], [act], [IsDelete], [imageUrl]) VALUES (N'12', N'黄芪羊肉汤', N'/wwwroot/Food/cc60667e-d06b-4dc7-8e69-7ac650bff59e.jpg', N'*羊肉1000g 
*黄芪50g 
*花椒2g
*八角2g
*姜10g
*盐10g
*小葱10g
*枸杞适量
*料酒适量', N'*将羊肉切成方块，冲洗干净。
*将羊肉放入煮锅中，添入适量冷水。
*放入料酒，煮开后小火煮约5分钟，捞出用温水撇去浮沫。
*准备好黄芪，剪成小块。
*砂锅中添入适量冷水，煮至水开。
*放入羊肉。
*放入黄芪。
*放入姜片。
*撇净浮沫。
*盖上盖子，小火，煮约2小时。
*打开盖子放入红枣，再煮约25分钟。
*放入枸杞，放入盐，搅匀后静置一会，即可使用', N'益气固摄', N'0', NULL)
GO

INSERT INTO [dbo].[tbFood] ([id], [name], [image], [material], [method], [act], [IsDelete], [imageUrl]) VALUES (N'13', N'八珍排骨汤', N'/wwwroot/Food/ff55b7d6-305e-4563-a61a-702c48564c49.jpg', N'*排骨500g 
*高丽参4g 
*茯苓13g 
*灸甘草4g
*白术8g
*熟地黄4g
*白芍10g
*川穹10g
*当归2g
*姜2片
*料酒 10g
*食盐 4g(可根据个人口味调整)
*水适量', N'*将高丽参、当归、川穹、白芍、熟地黄、白术、茯苓、灸甘草冲洗干净
*将洗净的材料用清水侵泡约15分钟
*排骨斩成块
*在锅里放入排骨，适量姜、料酒的沸水中烫，去除杂质和血水后沥干水分待用
*将侵泡好过的材料放入隔水炖锅中
*将侵泡好过的排骨也放入隔水炖锅中
*往隔水炖锅中加入适量清水
*盖上锅盖，2小时后即可煲煮
*出锅前根据个人口味加入适量食盐调味即可食用', N'补气益血，固摄乳汁', N'0', NULL)
GO

INSERT INTO [dbo].[tbFood] ([id], [name], [image], [material], [method], [act], [IsDelete], [imageUrl]) VALUES (N'14', N'苦瓜丝', N'/wwwroot/Food/911cf7b6-cb99-4229-b82a-0dee3bc168fe.jpg', N'*苦瓜1根 
*姜4g
*葱4g
*植物油少许
*盐适量', N'*先将苦瓜取内膜、洗净，顺丝切成细丝备用
*锅里倒油烧热，姜丝、葱丝
*加入苦瓜丝，用盐煸炒片刻即可', N'具有清热解毒的作用', N'0', NULL)
GO

INSERT INTO [dbo].[tbFood] ([id], [name], [image], [material], [method], [act], [IsDelete], [imageUrl]) VALUES (N'15', N'食疗(一)', N'/wwwroot/Food/11c8017f-0283-472e-bc86-9bc76b7a9f6b.jpg', N'*姜活18g
*白酒适量', N'*姜活以醇酒1杯煎，候浓温服', N'缓解产后痉症；', N'0', NULL)
GO

INSERT INTO [dbo].[tbFood] ([id], [name], [image], [material], [method], [act], [IsDelete], [imageUrl]) VALUES (N'23', N'虾仁蒸蛋', N'/wwwroot/Food/1cc504a1-80dc-4fea-9870-265daa78fdad.png', N'*鸡蛋 2个
*温水 180-190克
*虾仁 12颗
*料酒 1勺
*生抽 2勺
*盐 少许
*胡椒粉 少许
*猪油 1小勺
*小葱 一根
', N'*鸡蛋加入少许盐，用筷子打散
*打散后，加入180克左右的水，继续搅打均匀
*将打好的鸡蛋液用网筛过滤一下，一定要过筛，这样鸡蛋羹会更细腻些
*此时将美的蒸烤箱的水箱里，装入水，然后安装好
*将鸡蛋羹送入蒸烤箱中层，蒸烤箱下层最好放个烤盘，可以接水蒸气的水
*蒸鸡蛋的同时，我们开始处理虾肉，将买回来的河虾去头去壳，然后开背去虾线再洗干净。放入碗内，加入1勺料酒和适量胡椒粉稍微腌制一会
*当蒸烤箱还剩下7分钟的时候，打开蒸烤箱门，将虾肉摆放在鸡蛋羹上，再次关上蒸烤箱门，烤完剩下时间即可
', N'益气固脱', N'0', NULL)
GO

INSERT INTO [dbo].[tbFood] ([id], [name], [image], [material], [method], [act], [IsDelete], [imageUrl]) VALUES (N'24', N'土豆焖牛腩', N'/wwwroot/Food/881efa85-4edc-4a40-97c1-7e4ba5c7ab1e.png', N'*牛腩	500克
*土豆	适量
*胡萝卜1根
*食盐5克
*姜2片
*八角2个
*桂皮1块
*料酒5克
*生抽5克
*香叶2片
*柱侯酱5克
*水适量
', N'*牛腩用冷水冲洗干净，切成3厘米大小的方块，将牛肉块放入锅中，加入足量的冷水(水量以完全没过牛肉块为准)大火烧沸后继续煮制2分钟，待血沫完全淅出后，将牛肉块捞出洗净
* 将冼净的牛肉块放入电饭煲内胆里，加入八角、桂皮、香叶、生抽
*柱候酱和姜片、料酒，搅拌均匀
*接着放入适量的水，调焖的程序，让牛肉在电饭煲里焖40分钟
*将焖好的牛肉取出，放入锅中
*再将事先切好土豆和胡萝卜块放入锅中
*小火继续纯煮25分钟，调入适量的盐即可出锅
', N'益气固脱', N'0', NULL)
GO

INSERT INTO [dbo].[tbFood] ([id], [name], [image], [material], [method], [act], [IsDelete], [imageUrl]) VALUES (N'25', N'西红柿烧茄子', N'/wwwroot/Food/3e368116-f500-4e11-834b-8fe06b3375ae.png', N'*茄子  适量
*番茄  适量
*木耳  适量
*蒜  适量
*蚝油  适量
*糖  适量
*生抽  适量
', N'* 木耳泡发；茄子切块；番茄切块；蒜切蒜粒。
*锅中倒一些油，先将茄子锅油煎软， 盛出备用。
*茄子盛出后，将蒜粒倒入锅中，用底油炒香
*放入番茄块翻炒，将番茄炒软，出汤，成酱状
*放入木耳翻炒一分钟
*将茄子倒入
*倒入蚝油
*根据口味加糖和少许生抽，以大火烧约2分钟入味即可
', N'益气固脱', N'0', NULL)
GO

INSERT INTO [dbo].[tbFood] ([id], [name], [image], [material], [method], [act], [IsDelete], [imageUrl]) VALUES (N'26', N'小炒虾仁', N'/wwwroot/Food/66358718-0bce-4e38-97d3-0075b37678b7.png', N'*鲜虾仁  适量
*西芹  适量 
*白果仁 适量
*杏仁  适量
*百合  适量
*盐  适量
*油  适量
', N'* 将西芹切段或片，与白果仁、杏仁、百合等一同焯水;
*再将虾仁上浆，并放在油锅里过一下;
*最后将取出后的虾仁与西芹等一同炒制即成
', N'通乳，其肉质松软，易消化，对身体虚弱以及病后需要调养的人是极好的食物', N'0', NULL)
GO

INSERT INTO [dbo].[tbFood] ([id], [name], [image], [material], [method], [act], [IsDelete], [imageUrl]) VALUES (N'27', N'香菇豆腐', N'/wwwroot/Food/5ff70009-1c6a-45c7-8aa7-efddbc57f2c9.png', N'*香菇75克、
*豆腐300克、
*糖10克、
*酱油20毫升、
*味精1克、
*胡椒粉0.5克、
*料酒8毫升。
', N'*先将豆腐切成3.5厘米长、2.5 厘米宽、0.5厘米厚的长方条，
*香菇洗净去蒂;紧接着炒锅上火烧热油，
*逐渐下豆腐，用文火煎至一面结硬壳呈金黄色;
*最后烹入料酒，下入香菇，放入一切调味品后加水，用旺火收汁、勾芡，翻动后出锅
', N'香菇降低胆固醇，豆腐有利减肥', N'0', NULL)
GO

INSERT INTO [dbo].[tbFood] ([id], [name], [image], [material], [method], [act], [IsDelete], [imageUrl]) VALUES (N'28', N'桃仁鸡丁', N'/wwwroot/Food/ea0e6346-9073-4866-a1a9-8c0d912000b6.png', N'*鸡胸脯肉(300克) 
*核桃(100克) 
*鸡蛋(70克) 　
*黄酒(10克) 
*盐(3克) 
*味精(2克) 
*白砂糖(10克) 
*淀粉(豌豆)(10克) 
*猪油（炼制）(75克)
', N'*鸡脯肉去皮去骨，切成丁放入碗内，
*加蛋清，精盐，味精，干淀粉拌和上浆。
*炒锅上火，下猪油，烧至五成热，倒入鸡丁，滑至断生，捞出沥油。
*锅内留油少许，下核桃仁，加鲜汤50克和绍酒，精盐，味精，放入鸡丁，烧沸后用湿淀粉勾芡，淋上熟猪油少许即成。
', N'补血调理，贫血调理，益智补脑调理。', N'0', NULL)
GO

INSERT INTO [dbo].[tbFood] ([id], [name], [image], [material], [method], [act], [IsDelete], [imageUrl]) VALUES (N'29', N'韭菜炒鸡蛋', N'/wwwroot/Food/8eca2d63-2350-4e62-a91a-4c7de39b7112.png', N'*鸡蛋	2个，
*韭菜  适量
*植物油  适量
*姜末  适量
*盐  适量
*味精  适量
', N'*韭菜洗净切小段，鸡蛋破壳后在碗里打匀，油锅烧热，
*搅匀的鸡蛋放锅里面先煎成大块鸡蛋，再放入韭菜与鸡蛋一起炒熟即可。
', N'温中养血，温暖腰膝。', N'0', NULL)
GO

INSERT INTO [dbo].[tbFood] ([id], [name], [image], [material], [method], [act], [IsDelete], [imageUrl]) VALUES (N'30', N'土豆焖牛腩', N'/wwwroot/Food/90871ea5-4bce-4cf2-b603-910607c481e7.png', N'*牛腩	500克
*土豆	适量
*胡萝卜1根
*食盐5克
*姜2片
*八角2个
*桂皮1块
*料酒5克
*生抽5克
*香叶2片
*柱侯酱5克
*水适量
', N'*牛腩用冷水冲洗干净，切成3厘米大小的方块，将牛肉块放入锅中，加入足量的冷水(水量以完全没过牛肉块为准)大火烧沸后继续煮制2分钟，待血沫完全淅出后，将牛肉块捞出洗净
* 将冼净的牛肉块放入电饭煲内胆里，加入八角、桂皮、香叶、生抽
*柱候酱和姜片、料酒，搅拌均匀
*接着放入适量的水，调焖的程序，让牛肉在电饭煲里焖40分钟
*将焖好的牛肉取出，放入锅中
*再将事先切好土豆和胡萝卜块放入锅中
*小火继续纯煮25分钟，调入适量的盐即可出锅
', N'益气固脱', N'0', NULL)
GO

INSERT INTO [dbo].[tbFood] ([id], [name], [image], [material], [method], [act], [IsDelete], [imageUrl]) VALUES (N'31', N'当归红糖煮鸡蛋', N'/wwwroot/Food/513211bb-b366-497d-830e-e5926839be61.png', N'*当归	10克
*红枣	3个
*鸡蛋	1个
*甘汁园纯正红糖	10克
*水	1.5升
', N'*先备好食材，将红枣洗净，当归片用清水冲洗一下，
*将红枣、当归一起放入锅中，加1.5升清水煮沸后，中火煮20分钟，将汤汁收至一碗的量。
*另取一小锅，将生鸡蛋打入温水中，小火煮至蛋白定型，蛋黄半凝固。
*将煮至半熟的荷包蛋舀入当归红枣汤中，小火加热两三分钟，到蛋黄熟透。
*最后按照个人口味，在汤中逐次少量加入红糖，调匀到喜欢的甜度即可。
可以在做好的汤中撒几颗洗净的枸杞子，更兼明目的功效。
', N'活血化瘀，有利水利尿的功效,月经期间则有助子宫废物排出,能缓解腹胀,腰紧症状。', N'0', NULL)
GO

INSERT INTO [dbo].[tbFood] ([id], [name], [image], [material], [method], [act], [IsDelete], [imageUrl]) VALUES (N'32', N'咸肉萝卜汤', N'/wwwroot/Food/8bf10bc1-149e-44b0-9ffd-e0723bdf7c51.png', N'* 白萝卜（中等）	半根
*熟咸猪手（也可以生的咸肉）	8-10片
', N'*萝卜，咸肉及700-800毫升水，
*加适量盐（太咸的肉也许不需要加盐），
*中火煮40分钟。
*起锅，加一点葱花。
', N'促消化、补气顺气。', N'0', NULL)
GO

INSERT INTO [dbo].[tbFood] ([id], [name], [image], [material], [method], [act], [IsDelete], [imageUrl]) VALUES (N'33', N'藕粉', N'/wwwroot/Food/d54b87fe-b3aa-4036-8248-1d92f547ded7.png', N'*莲藕去皮后	500克
*清水	500—-800克
', N'*莲藕两节，一般选红莲藕，淀粉含量比白莲藕高，莲藕选短，粗，色深孔小的出粉率会达到10%
*去皮
*擦丝或者切小块
*放入料理机，加入500克水
*搅拌至非常细腻
*过筛或者用双层纱布隔出渣，最好是双层纱布隔渣，如果没有双层纱布就用40到60目的筛子过筛，也有人用20目的筛子过筛，但是20目的成品应该比较粗糙
*过滤掉莲藕渣以后会得到一大碗水，把这碗水沉淀3到4个小时，第一阶段的工作就完成了
*现在来说说纱布里面或者筛子里面隔出来的莲藕渣，为了不浪费，我又加水，料理机搅拌10—15秒
*同样用纱布或者筛子把水过滤出来，过滤出来的水也是沉淀3到4个小时，那第一阶段的工作就算全部完成，现在就静待3到4个小时以后了，其实12—15个小时的静置会出更多一点粉，但是要放冰箱冷藏，不然现在夏天太热会坏掉
*别看这第二次，也是会沉淀出粉的，经过两次操作以后，我们总共得到两碗水，纱布或筛子里面的渣放一旁，我后面会教大家如何利用这些纱布或筛子里面的莲藕渣
* 4个小时后，把沉淀好的碗拿起来，把表面的水倒掉
*底部是一层洁白的沉淀物，推都推不太动
* 烤箱上下火70度热风循环烤半个小时
*然后把粉扣下来放入盘中或者直接放在垫硅油纸的烤盘上，开发酵的那个温度（35到38度）继续低温烘烤到干爽
*如果觉得还是晒干或者风干才最正宗，就不要用烤箱，干脆铺开直接晒干风干都可以
*如果觉得不够细腻，可以用料理机打成粉末
*记住：冲调藕粉要一直往一个方向搅拌，15克自制藕粉，加入25克凉白开，搅拌均匀，自制的藕粉一点都不会结块，如果静置一会儿，你会发现藕粉沉淀，水和藕粉分离，市售的藕粉如果有淀粉等添加剂，就不会出现粉水分离的状态
*倒入刚刚翻滚开的开水，一定要是开水，再加几颗枸杞子，然后就可以喝了，非常粘稠非常美味清香
', N'清热凉血，健脾开胃。', N'0', NULL)
GO

INSERT INTO [dbo].[tbFood] ([id], [name], [image], [material], [method], [act], [IsDelete], [imageUrl]) VALUES (N'34', N'哈密瓜盅', N'/wwwroot/Food/05933fcc-adc4-4628-a50e-6a021e6fc7d6.jpg', N'*哈密瓜 适量
*蛋   适量
*红萝卜  适量
*西洋芹  适量
', N'*哈密瓜洗净，由上端横切将内部籽挖除。
*蛋打散加少许水，红萝卜去除外皮切小丁，西洋芹洗净切小丁备用。
*将红萝卜西洋芹加入蛋液中再倒入哈密瓜肚子里。
*将哈密瓜移至蒸锅中，盖上锅盖以大火蒸至蛋液凝固即可
', N'哈密瓜水分多、容易有饱足感，并含有高纤维', N'0', NULL)
GO

INSERT INTO [dbo].[tbFood] ([id], [name], [image], [material], [method], [act], [IsDelete], [imageUrl]) VALUES (N'35', N'健康豆腐', N'/wwwroot/Food/14f361d2-6441-4e09-8ba2-caae473a0332.jpg', N'*豆腐  适量
*碗豆荚  适量
*黑木耳  适量
*金针  适量
*姜丝  适量
*葱  适量
*调味料  适量
*花生油  适量
*蚝油   适量 
*太白粉 适量
', N'*豆腐切长条,以热水川烫，金针用水泡开后,再用热水川烫。
*碗豆荚、黑木耳分别切丝备用。
*热锅入油爆香, 姜丝及葱段之后，分别将黑木耳、金针放入拌炒。
*放入豆腐、蚝油及少许的水,以小火闷煮约5分钟，
*起锅前再加入碗豆荚,并改以大火,略勾薄芡即可。
', N'碗豆荚、黑木耳有降低胆固醇的功效，并含有高纤维', N'0', NULL)
GO

INSERT INTO [dbo].[tbFood] ([id], [name], [image], [material], [method], [act], [IsDelete], [imageUrl]) VALUES (N'36', N' 茼蒿豆腐', N'/wwwroot/Food/3f6d95f8-fad5-4909-9082-870917c7fd43.png', N'*茼蒿：1把
*旭阳真老豆腐：1盒
*蒜泥：适量
*香油：适量
', N'*茼蒿洗净沥干切小段，老豆腐切块
*起锅倒油，放入蒜末炒出香味，放入茼蒿翻炒至半熟，倒入豆腐块和足量的水，加盐，中火煮8分钟
*滴入香油后关火即可
', N'通利小便，消除水', N'0', NULL)
GO

INSERT INTO [dbo].[tbFood] ([id], [name], [image], [material], [method], [act], [IsDelete], [imageUrl]) VALUES (N'37', N'茭白芹菜炒肉丝', N'/wwwroot/Food/3da398f1-86e5-498c-85a3-b3298369b151.png', N'*芹菜	200g
*茭白	100g
*肉丝	50g
*盐	  适量
*料酒	适量
*生抽	适量
*干辣椒	1个   
*淀粉	适量
', N'*先将切好的肉丝入淀粉和少许油抓匀待用
*茭白和芹菜切段
*热油，放入肉丝翻炒，加少许料酒（一果汁瓶盖）、生抽
*肉丝7成熟时舀出，加适量油，先将芹菜炒软，只有加入茭白翻炒
*茭白和芹菜都软了之后重新放入肉丝，将1个干辣椒掰两半加入
*翻炒，酌情再加一点点生抽，加盐
*翻炒出锅
', N'通利小便，消除水肿', N'0', NULL)
GO

INSERT INTO [dbo].[tbFood] ([id], [name], [image], [material], [method], [act], [IsDelete], [imageUrl]) VALUES (N'38', N'紫苏麻仁粥', N'/wwwroot/Food/b2968ef9-011d-4ceb-a79a-92ebeffa0a63.png', N'*苏子10克
*火麻仁15克
*粳米100克
', N'*先将苏子、火麻仁捣烂
*加水研，滤取汁
*与粳米同煮成粥
', N'润肠通便。适用于老人、产妇体虚肠燥、大便干结难解者。', N'0', NULL)
GO

INSERT INTO [dbo].[tbFood] ([id], [name], [image], [material], [method], [act], [IsDelete], [imageUrl]) VALUES (N'39', N'炖参肠', N'/wwwroot/Food/91c049aa-794a-4530-969a-56cc50a4f637.png', N'*葱5克
*姜 5克
*酱油10 克
*料酒50克
*猪大肠200克
*海参200克
*黑木耳50克
', N'*锅内放入水烧开，将发好、洗净、切成条的海参、大肠分别焯一下；
*将大肠放入锅内加水煮至五分熟，
*放海参、葱、姜、料酒、酱油，煮至海参、大肠酥烂
*然后加木耳，再煮至木耳熟时即可
', N'可养阴清火，益肠通便。用于产后阴血虚弱、虚火内灼、大便燥结者', N'0', NULL)
GO

INSERT INTO [dbo].[tbFood] ([id], [name], [image], [material], [method], [act], [IsDelete], [imageUrl]) VALUES (N'40', N'空心菜排骨汤', N'/wwwroot/Food/daf8d2d2-cfd6-4380-b105-78b29b3aec63.png', N'*空心菜  500克   
*猪排骨(大排}		250克  
*虾米	10克  
 *姜		5克   
*植物油		10克   
*盐		2克   
*味精	1克  
', N'* ''排骨洗净，斩成细件；
*空心菜去根洗净；
*虾米用清水浸泡；
*煲内加7碗清水，放入排骨、虾米，以猛火煮滚，转中火煮20分钟；
*入空心菜，加生油数没，煮5分钟调味上桌。
', N'清热解毒、利尿', N'0', NULL)
GO

INSERT INTO [dbo].[tbFood] ([id], [name], [image], [material], [method], [act], [IsDelete], [imageUrl]) VALUES (N'41', N'白果大肠煲', N'/wwwroot/Food/d0a0775c-b5cc-4d51-9ed5-c4ec88c482a7.png', N'*  猪大肠	600克   
*白果（鲜）	100克  
*白萝卜		300克   
*胡萝卜		50克  
*姜			5克   
*鸡粉		5克   
*盐			3克  
', N'* 将大肠、白果、白萝卜块、红萝卜块放入滚水中氽烫约2分钟，捞起沥干备用。
*热1小匙油，先爆香姜片，
*再加入调味料、烫过的大肠、白果、白萝卜块、红萝卜块拌炒均匀，
*转小火煮约2分钟即可。
', N'治疗便秘、补虚养身', N'0', NULL)
GO

SET IDENTITY_INSERT [dbo].[tbFood] OFF
GO


-- ----------------------------
-- Table structure for tbSick
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[tbSick]') AND type IN ('U'))
	DROP TABLE [dbo].[tbSick]
GO

CREATE TABLE [dbo].[tbSick] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [title] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [overview] varchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [acupoint] varchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [food] varchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [IsDelete] int DEFAULT ((0)) NULL,
  [pathogeny] varchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [analysis] varchar(max) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[tbSick] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'常见病因及症状',
'SCHEMA', N'dbo',
'TABLE', N'tbSick',
'COLUMN', N'pathogeny'
GO

EXEC sp_addextendedproperty
'MS_Description', N'病因分析与鉴别',
'SCHEMA', N'dbo',
'TABLE', N'tbSick',
'COLUMN', N'analysis'
GO


-- ----------------------------
-- Records of tbSick
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tbSick] ON
GO

INSERT INTO [dbo].[tbSick] ([id], [title], [overview], [acupoint], [food], [IsDelete], [pathogeny], [analysis]) VALUES (N'14', N'产后乳汁自漏', N'指产妇乳汁不经婴儿吮吸而自然流出着，称之“漏奶”', N'[{"key":15,"label":"中腕"},{"key":16,"label":"足三里"},{"key":17,"label":"神阙"},{"key":18,"label":"期门"},{"key":19,"label":"太冲"},{"key":20,"label":"阳陵泉"},{"key":21,"label":"脾俞"},{"key":22,"label":"血海"},{"key":23,"label":"气海"}]', N'[{"key":12,"label":"黄芪羊肉汤"},{"key":13,"label":"八珍排骨汤"}]', N'0', N'*气虚：乳计终日自漏，量少质稀，乳房柔软无胀满感。面色苍白，皮肤不润，心慌气短，神疲乏力。舌淡，脉细弱。
*肝郁：孔汁不断自行漏出，量少质浓，两乳胀硬疼痛。精神郁闷，性急易怒，或脘胀纳少。舌质正常或偏黯红，脉弦。
*肝热：乳计绵绵流出，量较多，质浓，或见乳房胀痛。口苦咽干，心烦易怒，多梦，头胀目眩，便秘尿黄，舌质红，苔薄黄，脉弦数或细数。', N'*气虚乳汁自漏与肝郁乳计自涌:前者属虚，后者属实。虚者，因产后失养或伤血过多，导致气血虚弱，胃气不固，失却控制机能所致，实者，多由怒气伤肝，肝气横逆犯胃，胃气不固失于摄纳引起。辨证要点为：虚者，乳房柔软，乳汁清稀，且少，且见气血两虚之象(如面色苍白，心慌气短，舌淡，脉细弱),实者，乳房胀硬，乳计较浓量多，必见形气俱实之征(如体质壮健，精神郁闷，性急易怒，舌质正常或偏黯红，脉弦涩)。
*肝热乳汁自漏与肝郁乳计自漏：虽同有“郁”象(如乳房胀高，性急易怒)，颇为疑似，然肝郁乳计自漏并无“热”象(如乳计漏出量较多，口苦咽干，脉数),而呈现一派气郁络阻之征(如乳房虽胀满，但漏出量较少,精神郁闷，性急易怒)。肝热乳汁自漏乃由郁怒伤肝，肝火亢盛，疏泄太过，迫乳外溢之故。其表现为乳计自漏兼有内热实证，辨证要点为：乳汁较浓量多，或乳房胀痛(但触之较柔软)，口苦咽干，心烦易怒，多梦，头胀目眩，舌红，苔黄，脉细数。
*乳计为血所化生，赖气以运行及制约，故乳汁的多少和排出情况均与人体的血气有密切关系、但乳房属胃，乳头属肝。肝气条达，胃气健强，则乳汁蓄泄有时，故乳汁的蓄泄又受肝、胃功能的影响。产后血气虚弱，固摄无权，或郁怒伤肝，肝横犯胃，胃气虚弱：或因怒伤肝，肝火亢盛，疏泄太过，皆可引起乳汁自漏。')
GO

INSERT INTO [dbo].[tbSick] ([id], [title], [overview], [acupoint], [food], [IsDelete], [pathogeny], [analysis]) VALUES (N'15', N'产后发热', N'指分娩后出现全身发热，并伴有其他症状者。产后一二日，由于阴血骤虚而出现的轻微发热，属于正常现象不需治疗。西医学产褥感染可参照本症治疗，其重症，可危及产妇的生命。', N'[{"key":5,"label":"大椎"},{"key":24,"label":"中级"},{"key":25,"label":"风池"},{"key":17,"label":"神阙"},{"key":15,"label":"中腕"},{"key":16,"label":"足三里"},{"key":21,"label":"脾俞"},{"key":27,"label":"三阴交"}]', N'[{"key":14,"label":"苦瓜丝"}]', N'0', N'*外感风邪：发热恶寒，头痛身重，腰背痠楚，口干不渴，无汗或自汗，舌苔薄白，脉浮。
*外感邪毒：发热，微恶寒，汗出，头痛，面红，口干，饮水不多，小腹疼痛或拒按，恶露秽臭，舌质稍红，苔薄黄，脉滑数。
*气虚：身热不甚，动则热增，头晕目眩，心慌气短，语声低怯，身体倦怠，或自汗出，舌质胖淡，苔薄白，脉浮数无力。
*血虚：发热夜甚，两颧时赤，或有盗汗，头晕目眩，心悸失眠，纳差，舌质淡苔少，脉细数。
*伤食：发热不扬，恶食嗳腐，恶心呕吐，脘腹胀满，大便异臭，舌苔多厚腻，脉滑。
*血淤：时有低热，恶露较少，色紫黯淡或夹血块，少腹阵痛拒按，口燥不欲饮，舌略紫，苔薄，脉涩或细弱。
*蒸乳：产后二三日内忽然发热，乳房胀满疼痛但不红肿，性急易怒，舌质正常，脉弦滑或弦数。', N'*产后外感风邪发热与产后外感邪毒发热:皆为实证，且起病急而热势甚。但两者起因与证候有别，故治亦不同,外感风邪发热乃围产后感受风邪，营卫失和，故恶寒发热，头痛，身痛，脉浮。而外感邪毒发热乃因产后血室正开，邪毒乘虚内侵，或会阴裂伤，感受邪毒化脓而引起,证见发热恶寒，汗出，头痛，面红，口干，渴不多饮，小腹疼痛或拒按，恶露气臭，舌红苔黄，脉数、两者相比，前者病邪偏于表，后者邪毒炽于内。
*产后气虚发热与产后血虚发热:同属产后虚热，但患者之体质 与病因、症状有明显区别。气虚发热见于气虚阳虚之体，复因产后操劳过早，损伤中气，虚阳外浮，故见发热。血虚发热见于血虚阴虚之体，由于产时出血过多，阴不维阴,故见发热。两者的鉴别要点为:气虚发热者热势不甚，烦劳则增，件有气短，身困，自汗，舌质胖淡等症，血虚发热者入夜热增、件有颧赤、盗汗、心悸，脉细数等症。
*产后血瘀发热与产后蒸乳发热:同属内瘀发热。但前者因恶露不下，淤血阻滞，营卫不和所致;后者因阳明气滞，乳脉不通，乳汁停滞引起。所以，虽然两者均见发热，但证型不同。血瘀发热，症见恶露不下，少腹痛而拒按，脉涩，舌紫。蒸乳发热，症见乳汁不下，乳房胀痛，脉弦滑。
*产后伤食发热:乃因产后饮食不节，食停胃脘所致，其特点为:热势不扬，时作时止，件有嗳腐时呕，脘腹胀满，大便异臭，舌苔厚腻而黄。
产后发热证型复杂。临床辨证，要根据产后的生理特点，即虚中夹瘀，瘀中有虚，然后视其邪气之盛衰来确定证候的性质。')
GO

INSERT INTO [dbo].[tbSick] ([id], [title], [overview], [acupoint], [food], [IsDelete], [pathogeny], [analysis]) VALUES (N'16', N'产后痉症', N'指新产后，发生手足抽搐，项背强直，甚至口噤，角弓反张等症状。', N'[{"key":5,"label":"大椎"},{"key":28,"label":"曲池"},{"key":26,"label":"合谷"},{"key":29,"label":"大陵"},{"key":30,"label":"劳宫"},{"key":19,"label":"太冲"},{"key":23,"label":"气海"},{"key":25,"label":"风池"},{"key":16,"label":"足三里"}]', N'[{"key":15,"label":"食疗(一)"}]', N'0', N'*血虚：骤然口噤不开，项背强直，四肢抽搐，甚则角弓反张，面色苍白。舌淡红苔少，脉细。
*风寒：初起发热恶寒，头痛身重，无汗，继而四肢抽搐，项背强直。口噤角弓反张，苔薄白，脉浮弦。
*邪毒：初起发热恶寒，头项强痛，牙冠紧闭，口角搐动，舌质轻黯，苔薄白，脉弦紧', N'*产后血虚发痉:多由户后出血过多，复大汗出，伤其津液，血少津枯，筋脉失养，肝风内动而致痉。辨证要点为:户后失血过多，并伴汗出，旋而出现回肢抽搐，项背强直与角弓反张。据此即可诊为户后血虚发痉。
*产后风寒发痉:乃因户后血虚感受风寒之邪所致。本症有明显的感受风寒史，初起必见表证，如发热恶寒，头痛身重，无汗等。继而出现四肢抽搐，项背强直，口噤，角弓反张等证，若无感受风寒史，则不宜诊为本症。
*产后邪毒发痉:乃因户创伤口不洁，感染邪毒，窜入经脉为患。辨证要点为:牙关紧闭，并呈苦笑面容，舌质青黯，脉弦有力。
*产后发痉一症，总以血虚为本，风邪相搏为标。而风邪又有外风、内风之不同。所以治则不外养血祛风两途。关键在于早治，若延误时日，多至危候而难救。')
GO

INSERT INTO [dbo].[tbSick] ([id], [title], [overview], [acupoint], [food], [IsDelete], [pathogeny], [analysis]) VALUES (N'24', N'产后便秘', N'产妇产后饮食如常，但大便数日不行或排便时干燥疼痛，难以解出者，称为产后便秘，或称产后大便难，是最常见的产后病之一。', N'[{"key":16,"label":"足三里"},{"key":46,"label":"天枢"},{"key":47,"label":"大肠俞"},{"key":48,"label":"支沟"},{"key":49,"label":"大横"},{"key":23,"label":"气海"},{"key":50,"label":"腹结"}]', N'[{"key":36,"label":" 茼蒿豆腐"},{"key":37,"label":"茭白芹菜炒肉丝"},{"key":38,"label":"紫苏麻仁粥"},{"key":39,"label":"炖参肠"}]', N'0', N'* 由于产褥期胃肠功能减弱，肠蠕动慢，肠内容物在肠内停留时间长，使水分吸收造成大便干结。
*经过妊娠腹部过度膨胀，使腹部肌肉和盆底组织松弛，排便力量减弱
*产后人体虚弱排便力量减弱。所以产后经常有便秘现象。
*饮食结构不合理，蔬菜、水果吃得少。
', N'* 胃肠功能减低，蠕动缓慢，肠内容物停留过久，水分被过度吸收
*怀孕期间，腹壁和骨盆底的肌肉收缩力量不足
*会阴和骨盆或多或少的损伤，通过神经反射，抑止排便动作
*产后饮食过于讲究所谓高营养，缺乏纤维素，食物残渣减少
*下床活动不便，许多产妇又不习惯在床上用便盆排便
')
GO

INSERT INTO [dbo].[tbSick] ([id], [title], [overview], [acupoint], [food], [IsDelete], [pathogeny], [analysis]) VALUES (N'25', N'产后肥胖', N'产后肥胖是许多孕妇会产生的一种症状，产后肥胖是由于女性怀孕期间体内的激素增加和产后身体情况所产生的落差，导致激素分泌的紊乱，新陈代谢会减慢，导致体重增加', N'[{"key":16,"label":"足三里"},{"key":27,"label":"三阴交"},{"key":15,"label":"中脘"},{"key":51,"label":"梁丘"},{"key":46,"label":"天枢"},{"key":52,"label":"外关"},{"key":26,"label":"合谷"}]', N'[{"key":34,"label":"哈密瓜盅"},{"key":35,"label":"健康豆腐"}]', N'0', N'* 因为妊娠过程引起下丘脑-性腺功能暂时紊乱，特别是脂肪代谢失去平衡
*传统的“坐月子”的理论，在产后的头一个月内，为了哺乳，让妈妈吃下大量的高脂肪高蛋白质食品，使摄入的营养量大大超过需要量，而极少的体力活动又使能量消耗大为降低，最终使机体脂肪细胞充盈。
', N'* 体质的改变：气血双亏是女性产后常见的现象，此时女性大多出现经络不通、气滞血瘀，基础代谢率降低的现象，这就在无形中影响身体正常恢复，也可阻碍脂肪的正常代谢水平。
*内分泌的改变：妊娠期间，女性下丘脑性腺功能出现暂时紊乱现象，导致脂肪代谢失去平衡，引起肥胖现象
*水肿：怀孕期间，子宫日益膨大产生一种迫力，导致身体循环系统中静脉回流受阻，形成程度不同的妊娠水肿现象；分娩和产后大量的血液回到循环系统，引起产后身体肿胀
*柯兴综合症：原因：肾上腺皮质功能亢进，皮质醇分泌过多。现象：脸、脖子和身体肥大，但四肢则脂肪不多。
')
GO

INSERT INTO [dbo].[tbSick] ([id], [title], [overview], [acupoint], [food], [IsDelete], [pathogeny], [analysis]) VALUES (N'26', N'产后腹胀', N'产后精神不振,四肢无力,腹部胀大如产前,下肢虚肿,不思饮食,食则胀更甚', N'[{"key":53,"label":"气舍"},{"key":54,"label":"百会"},{"key":55,"label":"关元"},{"key":17,"label":"神阙"},{"key":27,"label":"三阴交"},{"key":15,"label":"中脘"},{"key":56,"label":"太白"},{"key":57,"label":"会阳"}]', N'[{"key":33,"label":"藕粉"},{"key":32,"label":"咸肉萝卜汤"}]', N'0', N'* 为促进产后乳汁分泌,再加上产时用力和失血,许多产妇和家属都认为 ,产后应加强营养,及时滋补身体,于是产后即进食高热量、 高蛋白、 富营养食物,包 括糖、 蛋、 奶等易产气食物,甚至过量饮食,再加上未被消化的胃内容物腐败产生大量的气体,增加了腹胀。另外,食物中缺乏粗纤维,病人便秘,亦增加腹胀
*剖腹产术后病 人和顺娩的产妇都是由于伤口疼痛原因,不愿翻身,更不愿下床活动,这样长时间不活动,胃肠蠕动减慢,肠内微生物繁殖,产气不能排出,导致肠胀气
*手术后肛门排气前 , 病人由于饥饿过度 , 过早进食 , 增加腹胀
', N'* 胃肠功能减低，蠕动缓慢，肠内容物停留过久，水分被过度吸收。 
*怀孕期间，腹壁和骨盆底的肌肉收缩力量不足
')
GO

INSERT INTO [dbo].[tbSick] ([id], [title], [overview], [acupoint], [food], [IsDelete], [pathogeny], [analysis]) VALUES (N'27', N'产后乳腺炎', N'产后乳腺炎是产褥期常见的一种疾病，多为急性乳腺炎，常发生于产后3~4周的哺乳期妇女，所以又称之为哺乳期乳腺炎。急性乳腺炎的致病菌多为金黄色葡萄糖球菌及溶血性链球菌，经乳头的裂口或血性感染所致', N'[{"key":58,"label":"少泽"},{"key":59,"label":"膻中"},{"key":60,"label":"乳根"},{"key":61,"label":"膺窗"}]', N'[{"key":29,"label":"韭菜炒鸡蛋"},{"key":30,"label":"土豆焖牛腩"},{"key":31,"label":"当归红糖煮鸡蛋"}]', N'0', N'*乳汁淤积：乳汁没按时排空，易造成乳汁淤积，而孩子的吸吮姿势错误，奶水自然无法被完全吸出。婴儿在吃不到奶的情況下，会愈发大力地吸吮，将新妈妈的乳头弄破，从而造成感染，使细菌侵入乳房组织。此外，在喂奶时，不可用手指按压乳房，因为这么做会阻碍奶水的流出
 *乳管阻塞：乳房的乳腺腺叶或小叶导管上皮细胞脱落后可能会进入乳汁，造成乳管的阻塞，乳管阻塞会加重乳汁的淤积。乳汁淤积会使乳腺组织变得较脆弱，使乳房易受到细菌的攻击。因此，新妈妈应及时排空奶水
', N'* 孕期忽视了乳头的保养，而使乳头皮肤表皮薄弱易损。由于初产妇的乳头皮肤抵抗力较弱，容易在宝贝的吸吮下造成损伤，使乳汁淤积，细菌侵入
*乳汁排通不畅，淤积乳房内。乳汁淤积，排乳不畅是产后乳腺炎发病的主要原因。造成乳汁滞留的原因可能是宝宝吸吮姿势不正确，导致奶水没办法完全被吸出。而宝宝在吸不到乳汁的情況下便会越吸越大力，会将妈妈的乳头咬破，进而造成细菌感染，使细菌进入乳房组织。另外，妈妈在喂奶时用指头挤压乳房，也会阻碍乳汁的流出。
')
GO

INSERT INTO [dbo].[tbSick] ([id], [title], [overview], [acupoint], [food], [IsDelete], [pathogeny], [analysis]) VALUES (N'28', N'产后抑郁', N'产后抑郁症又称为产后抑郁障碍，目前认为产后抑郁症并非一个独立的疾病， 而是特发于女性产后这一特殊时期的抑郁症。患者最突出的症状是持久的情绪低落，表现为表情阴郁，无精打采、困倦、易流泪和哭泣。患者常用“郁郁寡欢”、“凄凉”、“沉闷”、“空虚”、“孤独”、“与他人好像隔了一堵墙”之类的词来描述自己的心情。患者经常感到心情压抑、郁闷，常因小事大发脾气。', N'[{"key":19,"label":"太冲"},{"key":59,"label":"膻中"},{"key":62,"label":"行间"},{"key":63,"label":"肝俞"},{"key":22,"label":"血海"},{"key":16,"label":"足三里"},{"key":18,"label":"期门"},{"key":30,"label":"劳宫"},{"key":64,"label":"神门"},{"key":20,"label":"阳陵泉"},{"key":27,"label":"三阴交"},{"key":66,"label":"隐白"}]', N'[{"key":26,"label":"小炒虾仁"},{"key":27,"label":"香菇豆腐"},{"key":28,"label":"桃仁鸡丁"}]', N'0', N'*遗传因素：在家系中体现明显，血缘关系越近，患病的可能性也越高。且本病目前倾向于多基因遗传模式。
*神经生化因素：某些人体内的神经递质功能活动异常，5-羟色胺、去甲肾上腺素、多巴胺等,可能与产后抑郁发作有关。
*神经内分泌功能失调：产后抑郁的患者可能存在下丘脑-垂体-肾上腺轴、下丘脑- 垂体甲状腺、下丘脑- 垂体-生长素轴的异常，其中下丘脑-垂体-肾上腺轴是神经内分泌系统的重要部分，可以调节许多身体活动，影响心情和情绪变化。而产后性激素骤降可能也是罹患产后抑郁的一个重要原因。
*社会心理因素：单用遗传因素无法解释其病因，而产后抑郁的发生，与应激性生活事件、环境事件有一定关系。 
', N'* 产后情绪不良：产后心绪不良是一种短暂性的适应不良状态，常见症状与本病类似，如情绪不稳定、易哭泣、易激动、悲哀、焦虑、注意力不集中、失眠和食欲不振等,但持续时间较短，多为几天，一般不超过10天， 且对产妇的社会功能影响不大，通常并不需要特殊干预，需与本病鉴别
*继发性抑郁症
某些疾病及药物和精神活性物质等，均可引起抑郁情绪,被称为继发性抑郁症。不过其有明确的器质性疾病、某些药物或精神活性物质应用史，体格检查及辅助检查有明显指征，一般抑郁情绪可随原发疾病的病情相应好转而缓解，可与本病鉴别。
*创伤后应激障碍
创伤后应激障碍常伴有轻度抑郁情绪，但PTSD患者发病是因为经历严重的、灾难性的创伤性事件，如新生儿天折、严重畸形或其他天灾人祸，通常有警觉性升高、闪回、回避等表现，产后抑郁的患者通常无上述表现，故可以鉴别。
*神经衰弱
轻度抑郁常有头晕、头痛、无力和失眠等主诉，易误诊为神经衰弱，但神经衰弱患者并不会出现情感低落,而且主动寻求治疗，病前往往明显引起大脑活动过度紧张等精神因素。
')
GO

INSERT INTO [dbo].[tbSick] ([id], [title], [overview], [acupoint], [food], [IsDelete], [pathogeny], [analysis]) VALUES (N'29', N'产后子宫脱垂', N'子宫从正常的位置沿阴道下降，脱出于宫颈外口，严重者甚至完全脱出于阴道外口，并合并阴道前壁及后壁膨出，因子宫与膀胱和直肠相毗邻，故常合并膀胱脱垂和直肠的脱垂，常伴有尿频、尿急或大便性质的改变。', N'[{"key":54,"label":"百会"},{"key":67,"label":"阴交"},{"key":55,"label":"关元"},{"key":23,"label":"气海"},{"key":68,"label":"子宫"},{"key":69,"label":"曲骨"},{"key":70,"label":"照海"},{"key":27,"label":"三阴交"}]', N'[{"key":23,"label":"虾仁蒸蛋"},{"key":24,"label":"土豆焖牛腩"},{"key":25,"label":"西红柿烧茄子"}]', N'0', N'*液外溢。大多数子宫脱垂患者，每当患者大笑、剧烈咳嗽、体势用力的时侯，腹腔的就会压力突然增加，引起尿液外溢
*风寒：月经改变及白带多。由于子宫脱垂，会导致血循环障碍，局部的淤血，影响正常月经周期，可能会使月经过多。另外，由于血循环的障碍脱出脏器会并发溃疡、感染，致使白带增多，并伴有血性分泌物。
*邪毒：阴道脱出肿物。会有球形物自阴道内脱出，当行走、体力劳动时会更加的明显，卧床休息之后会自行还纳。脱垂严重者，久经摩擦会发生溃疡、感染、分泌物增多，甚至出血，时间长了局部组织就会增厚角化。
*腰骶部酸痛。以骶部为最严重，劳动后疼痛更加明显，卧床休息之后会有所缓解。另外，患者会感到下腹、阴道、会阴部的下坠，也是以劳累之后更加严重。
*尿道膨出。有的患者没有什么异常的感觉，但是，有些患者却会感觉到阴道内会有什么东西脱出来，严重一些的会感到阴道的疼痛，甚至会有性交的困难。
', N'* 一般是由于女性在生产过程中骨盆韧带和肌肉松弛导致的，不能支撑子宫，使子宫坠入阴道
*结缔组织疾病：盆腔肌肉和筋膜是支撑骨盆脏器的主要组织，如果肌肉和筋膜由于抻拉过度或者受损，功能开始退化。所有有结缔组织疾病的女性比其他人患子宫脱垂的可能性更高。除此之外还有一些先天性疾病或者神经损伤也会引起骨盆脏器脱垂。
*更年期：当女人上了年纪，进入更年期后，卵巢功能开始退化，雌性激素衰退，盆腔支持组织也会弱化，处于更年期或者更年期后的女性更容易发生子宫脱垂
')
GO

INSERT INTO [dbo].[tbSick] ([id], [title], [overview], [acupoint], [food], [IsDelete], [pathogeny], [analysis]) VALUES (N'31', N'产后痔疮', N'女性怀孕后，体内的子宫增大，血液供应不足，随着胎儿的发育，子宫也在不断的长大，长大的子宫会影响到静脉的流通，造成血液回流不畅，导致形成痔疮', N'[{"key":72,"label":"长强"},{"key":71,"label":"承山"},{"key":54,"label":"百会"}]', N'[{"key":40,"label":"空心菜排骨汤"},{"key":41,"label":"白果大肠煲"}]', N'0', N'*孕妇期间或者是产后坐月子期间，体内的黄激素增多，大肠蠕动速度减慢，很容易便秘，形成便秘后，很易诱发成痔疮。生长过程当中，通过顺产，生产时间过长，就会加重痔疮。
*妊娠期间妇女体内的盆腔组织变得松弛，顺产过程当中，用力过大，腹腔部运动时间较长，易形成血栓性动脉，肛周皮肤就会形成硬块，产生疼痛，形成痔疮，一些剖腹产的孕妇也不例外，也会形成痔疮。
', N'* 因为在孕期之前，女性肛门处就会变得负重，特别是在经期跟纴娠期，出现排便困难的症状更为明显，2到3天一次便，甚至是一到两星期一次便，在妊娠期时，腹中胎儿压迫直肠，使得静脉血液回流不畅，产生痔核，形成痔疮。
*妇女在分娩期后，产后，因为腹中变得松弛，活动减少，便意很少，排便困难，常常会因粪便在直肠内部停留时间过长，粪便内的水分渐渐被身体所吸水，粪便干结，形成火粪块，甚至硬如羊屎，一块一块，排便用边时，直肠黏膜受到损伤，引发痔疮。
')
GO

INSERT INTO [dbo].[tbSick] ([id], [title], [overview], [acupoint], [food], [IsDelete], [pathogeny], [analysis]) VALUES (N'32', N'666', N'666', N'[{"key":5,"label":"大椎"},{"key":16,"label":"足三里"},{"key":17,"label":"神阙"}]', N'[{"key":12,"label":"黄芪羊肉汤"},{"key":13,"label":"八珍排骨汤"}]', N'1', N'666', N'66')
GO

INSERT INTO [dbo].[tbSick] ([id], [title], [overview], [acupoint], [food], [IsDelete], [pathogeny], [analysis]) VALUES (N'33', N'产后', N'指产妇乳汁不经婴儿吮吸而自然流出着，称之“漏奶”', N'[{"key":15,"label":"中脘"},{"key":5,"label":"大椎"},{"key":16,"label":"足三里"}]', N'[{"key":24,"label":"土豆焖牛腩"},{"key":23,"label":"虾仁蒸蛋"},{"key":14,"label":"苦瓜丝"}]', N'1', N'*气虚：乳计终日自漏，量少质稀，乳房柔软无胀满感。面色苍白，皮肤不润，心慌气短，神疲乏力。舌淡，脉细弱。
*肝郁：孔汁不断自行漏出，量少质浓，两乳胀硬疼痛。精神郁闷，性急易怒，或脘胀纳少。舌质正常或偏黯红，脉弦。
*肝热：乳计绵绵流出，量较多，质浓，或见乳房胀痛。口苦咽干，心烦易怒，多梦，头胀目眩，便秘尿黄，舌质红，苔薄黄，脉弦数或细数。
', N'*气虚乳汁自漏与肝郁乳计自涌:前者属虚，后者属实。虚者，因产后失养或伤血过多，导致气血虚弱，胃气不固，失却控制机能所致，实者，多由怒气伤肝，肝气横逆犯胃，胃气不固失于摄纳引起。辨证要点为：虚者，乳房柔软，乳汁清稀，且少，且见气血两虚之象(如面色苍白，心慌气短，舌淡，脉细弱),实者，乳房胀硬，乳计较浓量多，必见形气俱实之征(如体质壮健，精神郁闷，性急易怒，舌质正常或偏黯红，脉弦涩)。
*肝热乳汁自漏与肝郁乳计自漏：虽同有“郁”象(如乳房胀高，性急易怒)，颇为疑似，然肝郁乳计自漏并无“热”象(如乳计漏出量较多，口苦咽干，脉数),而呈现一派气郁络阻之征(如乳房虽胀满，但漏出量较少,精神郁闷，性急易怒)。肝热乳汁自漏乃由郁怒伤肝，肝火亢盛，疏泄太过，迫乳外溢之故。其表现为乳计自漏兼有内热实证，辨证要点为：乳汁较浓量多，或乳房胀痛(但触之较柔软)，口苦咽干，心烦易怒，多梦，头胀目眩，舌红，苔黄，脉细数。
*乳计为血所化生，赖气以运行及制约，故乳汁的多少和排出情况均与人体的血气有密切关系、但乳房属胃，乳头属肝。肝气条达，胃气健强，则乳汁蓄泄有时，故乳汁的蓄泄又受肝、胃功能的影响。产后血气虚弱，固摄无权，或郁怒伤肝，肝横犯胃，胃气虚弱：或因怒伤肝，肝火亢盛，疏泄太过，皆可引起乳汁自漏。
')
GO

INSERT INTO [dbo].[tbSick] ([id], [title], [overview], [acupoint], [food], [IsDelete], [pathogeny], [analysis]) VALUES (N'34', N'产后乳汁', N'指产妇乳汁不经婴儿吮吸而自然流出着，称之“漏奶”', N'[{"key":15,"label":"中脘"},{"key":16,"label":"足三里"}]', N'[{"key":13,"label":"八珍排骨汤"},{"key":14,"label":"苦瓜丝"},{"key":15,"label":"食疗(一)"}]', N'1', N'*气虚：乳计终日自漏，量少质稀，乳房柔软无胀满感。面色苍白，皮肤不润，心慌气短，神疲乏力。舌淡，脉细弱。
*肝郁：孔汁不断自行漏出，量少质浓，两乳胀硬疼痛。精神郁闷，性急易怒，或脘胀纳少。舌质正常或偏黯红，脉弦。
*肝热：乳计绵绵流出，量较多，质浓，或见乳房胀痛。口苦咽干，心烦易怒，多梦，头胀目眩，便秘尿黄，舌质红，苔薄黄，脉弦数或细数。
', N'*气虚乳汁自漏与肝郁乳计自涌:前者属虚，后者属实。虚者，因产后失养或伤血过多，导致气血虚弱，胃气不固，失却控制机能所致，实者，多由怒气伤肝，肝气横逆犯胃，胃气不固失于摄纳引起。辨证要点为：虚者，乳房柔软，乳汁清稀，且少，且见气血两虚之象(如面色苍白，心慌气短，舌淡，脉细弱),实者，乳房胀硬，乳计较浓量多，必见形气俱实之征(如体质壮健，精神郁闷，性急易怒，舌质正常或偏黯红，脉弦涩)。
*肝热乳汁自漏与肝郁乳计自漏：虽同有“郁”象(如乳房胀高，性急易怒)，颇为疑似，然肝郁乳计自漏并无“热”象(如乳计漏出量较多，口苦咽干，脉数),而呈现一派气郁络阻之征(如乳房虽胀满，但漏出量较少,精神郁闷，性急易怒)。肝热乳汁自漏乃由郁怒伤肝，肝火亢盛，疏泄太过，迫乳外溢之故。其表现为乳计自漏兼有内热实证，辨证要点为：乳汁较浓量多，或乳房胀痛(但触之较柔软)，口苦咽干，心烦易怒，多梦，头胀目眩，舌红，苔黄，脉细数。
*乳计为血所化生，赖气以运行及制约，故乳汁的多少和排出情况均与人体的血气有密切关系、但乳房属胃，乳头属肝。肝气条达，胃气健强，则乳汁蓄泄有时，故乳汁的蓄泄又受肝、胃功能的影响。产后血气虚弱，固摄无权，或郁怒伤肝，肝横犯胃，胃气虚弱：或因怒伤肝，肝火亢盛，疏泄太过，皆可引起乳汁自漏。
')
GO

SET IDENTITY_INSERT [dbo].[tbSick] OFF
GO


-- ----------------------------
-- Table structure for tbUser
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[tbUser]') AND type IN ('U'))
	DROP TABLE [dbo].[tbUser]
GO

CREATE TABLE [dbo].[tbUser] (
  [userId] int  IDENTITY(1,1) NOT NULL,
  [userName] varchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [passWord] varchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [age] int  NULL,
  [isDelete] int DEFAULT ((0)) NULL,
  [isManager] int DEFAULT ((0)) NULL
)
GO

ALTER TABLE [dbo].[tbUser] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of tbUser
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tbUser] ON
GO

INSERT INTO [dbo].[tbUser] ([userId], [userName], [passWord], [age], [isDelete], [isManager]) VALUES (N'1', N'admin', N'123456', N'15', N'0', N'1')
GO

INSERT INTO [dbo].[tbUser] ([userId], [userName], [passWord], [age], [isDelete], [isManager]) VALUES (N'2', N'洛洛', N'123456', N'0', N'0', N'0')
GO

INSERT INTO [dbo].[tbUser] ([userId], [userName], [passWord], [age], [isDelete], [isManager]) VALUES (N'4', N'123456', N'123456', N'0', N'0', N'0')
GO

INSERT INTO [dbo].[tbUser] ([userId], [userName], [passWord], [age], [isDelete], [isManager]) VALUES (N'5', N'1234567', N'123456', N'0', N'0', N'0')
GO

INSERT INTO [dbo].[tbUser] ([userId], [userName], [passWord], [age], [isDelete], [isManager]) VALUES (N'6', N'qwer', N'qwer', N'0', N'0', N'0')
GO

INSERT INTO [dbo].[tbUser] ([userId], [userName], [passWord], [age], [isDelete], [isManager]) VALUES (N'7', N'123', N'123', N'0', N'0', N'0')
GO

INSERT INTO [dbo].[tbUser] ([userId], [userName], [passWord], [age], [isDelete], [isManager]) VALUES (N'8', N'0309', N'string', N'0', N'0', N'0')
GO

INSERT INTO [dbo].[tbUser] ([userId], [userName], [passWord], [age], [isDelete], [isManager]) VALUES (N'9', N'1615', N'453462', N'0', N'0', N'1')
GO

INSERT INTO [dbo].[tbUser] ([userId], [userName], [passWord], [age], [isDelete], [isManager]) VALUES (N'10', N'111', N'yui', N'0', N'0', N'0')
GO

INSERT INTO [dbo].[tbUser] ([userId], [userName], [passWord], [age], [isDelete], [isManager]) VALUES (N'11', N'789', N'123', N'0', N'0', N'0')
GO

INSERT INTO [dbo].[tbUser] ([userId], [userName], [passWord], [age], [isDelete], [isManager]) VALUES (N'12', N'666', N'qwe', N'0', N'0', N'0')
GO

INSERT INTO [dbo].[tbUser] ([userId], [userName], [passWord], [age], [isDelete], [isManager]) VALUES (N'13', N'55', N'55', N'0', N'0', N'0')
GO

INSERT INTO [dbo].[tbUser] ([userId], [userName], [passWord], [age], [isDelete], [isManager]) VALUES (N'14', N'66', N'66', N'0', N'0', N'0')
GO

INSERT INTO [dbo].[tbUser] ([userId], [userName], [passWord], [age], [isDelete], [isManager]) VALUES (N'15', N'77', N'77', N'0', N'0', N'0')
GO

INSERT INTO [dbo].[tbUser] ([userId], [userName], [passWord], [age], [isDelete], [isManager]) VALUES (N'16', N'99', N'99', N'0', N'0', N'0')
GO

INSERT INTO [dbo].[tbUser] ([userId], [userName], [passWord], [age], [isDelete], [isManager]) VALUES (N'17', N'10', N'10', N'0', N'0', N'0')
GO

INSERT INTO [dbo].[tbUser] ([userId], [userName], [passWord], [age], [isDelete], [isManager]) VALUES (N'18', N'11', N'11', N'0', N'0', N'0')
GO

INSERT INTO [dbo].[tbUser] ([userId], [userName], [passWord], [age], [isDelete], [isManager]) VALUES (N'19', N'159', N'159', N'0', N'0', N'0')
GO

INSERT INTO [dbo].[tbUser] ([userId], [userName], [passWord], [age], [isDelete], [isManager]) VALUES (N'20', N'Qrt', N'66', N'0', N'0', N'0')
GO

INSERT INTO [dbo].[tbUser] ([userId], [userName], [passWord], [age], [isDelete], [isManager]) VALUES (N'21', N'qwe11', N'qwe11', N'0', N'0', N'0')
GO

INSERT INTO [dbo].[tbUser] ([userId], [userName], [passWord], [age], [isDelete], [isManager]) VALUES (N'22', N'12345689', N'2222222', N'0', N'0', N'0')
GO

INSERT INTO [dbo].[tbUser] ([userId], [userName], [passWord], [age], [isDelete], [isManager]) VALUES (N'23', N'9874', N'1234', N'0', N'0', N'0')
GO

SET IDENTITY_INSERT [dbo].[tbUser] OFF
GO


-- ----------------------------
-- Table structure for tbUserCollect
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[tbUserCollect]') AND type IN ('U'))
	DROP TABLE [dbo].[tbUserCollect]
GO

CREATE TABLE [dbo].[tbUserCollect] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [userId] int  NOT NULL,
  [objId] int  NOT NULL,
  [type] int DEFAULT ((0)) NOT NULL,
  [createDate] datetime  NOT NULL,
  [name] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[tbUserCollect] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of tbUserCollect
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tbUserCollect] ON
GO

INSERT INTO [dbo].[tbUserCollect] ([id], [userId], [objId], [type], [createDate], [name]) VALUES (N'35', N'9', N'19', N'0', N'2020-03-19 11:46:40.390', N'太冲')
GO

INSERT INTO [dbo].[tbUserCollect] ([id], [userId], [objId], [type], [createDate], [name]) VALUES (N'37', N'9', N'20', N'0', N'2020-03-19 14:03:31.077', N'阳陵泉')
GO

INSERT INTO [dbo].[tbUserCollect] ([id], [userId], [objId], [type], [createDate], [name]) VALUES (N'39', N'1', N'15', N'0', N'2020-03-19 20:08:29.040', N'中腕')
GO

INSERT INTO [dbo].[tbUserCollect] ([id], [userId], [objId], [type], [createDate], [name]) VALUES (N'41', N'1', N'16', N'0', N'2020-03-19 20:15:15.250', N'足三里')
GO

INSERT INTO [dbo].[tbUserCollect] ([id], [userId], [objId], [type], [createDate], [name]) VALUES (N'42', N'1', N'5', N'0', N'2020-03-21 19:21:17.300', N'大椎')
GO

INSERT INTO [dbo].[tbUserCollect] ([id], [userId], [objId], [type], [createDate], [name]) VALUES (N'44', N'12', N'19', N'0', N'2020-03-25 17:02:11.083', N'太冲')
GO

INSERT INTO [dbo].[tbUserCollect] ([id], [userId], [objId], [type], [createDate], [name]) VALUES (N'45', N'18', N'13', N'1', N'2020-03-25 17:09:27.433', N'八珍排骨汤')
GO

INSERT INTO [dbo].[tbUserCollect] ([id], [userId], [objId], [type], [createDate], [name]) VALUES (N'47', N'1', N'13', N'1', N'2020-03-25 17:23:10.667', N'八珍排骨汤')
GO

INSERT INTO [dbo].[tbUserCollect] ([id], [userId], [objId], [type], [createDate], [name]) VALUES (N'55', N'12', N'15', N'0', N'2020-04-07 13:07:19.743', N'中脘')
GO

INSERT INTO [dbo].[tbUserCollect] ([id], [userId], [objId], [type], [createDate], [name]) VALUES (N'57', N'4', N'15', N'0', N'2020-04-07 19:36:21.297', N'中脘')
GO

INSERT INTO [dbo].[tbUserCollect] ([id], [userId], [objId], [type], [createDate], [name]) VALUES (N'58', N'22', N'16', N'0', N'2020-04-08 20:39:04.680', N'足三里')
GO

INSERT INTO [dbo].[tbUserCollect] ([id], [userId], [objId], [type], [createDate], [name]) VALUES (N'59', N'23', N'5', N'0', N'2020-04-08 21:03:33.087', N'大椎')
GO

SET IDENTITY_INSERT [dbo].[tbUserCollect] OFF
GO


-- ----------------------------
-- Auto increment value for tbAcupoint
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[tbAcupoint]', RESEED, 72)
GO


-- ----------------------------
-- Primary Key structure for table tbAcupoint
-- ----------------------------
ALTER TABLE [dbo].[tbAcupoint] ADD CONSTRAINT [PK__tbAcupoi__3213E83FE9626E86] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for tbFood
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[tbFood]', RESEED, 41)
GO


-- ----------------------------
-- Primary Key structure for table tbFood
-- ----------------------------
ALTER TABLE [dbo].[tbFood] ADD CONSTRAINT [PK__tbFood__3213E83F7C171059] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for tbSick
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[tbSick]', RESEED, 34)
GO


-- ----------------------------
-- Primary Key structure for table tbSick
-- ----------------------------
ALTER TABLE [dbo].[tbSick] ADD CONSTRAINT [PK__Sick__3213E83F89FEFAE4] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for tbUser
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[tbUser]', RESEED, 23)
GO


-- ----------------------------
-- Primary Key structure for table tbUser
-- ----------------------------
ALTER TABLE [dbo].[tbUser] ADD CONSTRAINT [PK_tbUser] PRIMARY KEY CLUSTERED ([userId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for tbUserCollect
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[tbUserCollect]', RESEED, 59)
GO


-- ----------------------------
-- Primary Key structure for table tbUserCollect
-- ----------------------------
ALTER TABLE [dbo].[tbUserCollect] ADD CONSTRAINT [PK__tbUserCo__3213E83F508AC958] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

