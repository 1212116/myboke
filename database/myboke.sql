/*
 Navicat MySQL Data Transfer

 Source Server         : 我的MySQL
 Source Server Type    : MySQL
 Source Server Version : 50737
 Source Host           : localhost:3306
 Source Schema         : myboke

 Target Server Type    : MySQL
 Target Server Version : 50737
 File Encoding         : 65001

 Date: 11/12/2022 16:35:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cid` bigint(20) UNSIGNED NOT NULL,
  `desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `comment_count` bigint(20) NOT NULL DEFAULT 0,
  `read_count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_article_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, '2022-11-24 12:34:45.099', '2022-12-07 15:58:02.735', NULL, 'mysql的使用', 2, '第一篇博客', '第一篇博客', 'http://rlwhi14je.hd-bkt.clouddn.com/Fm3Fu-rOstGIdrhFMfj4E-vsX099', 0, 12);
INSERT INTO `article` VALUES (2, '2022-11-24 12:35:45.853', '2022-11-24 12:42:34.993', '2022-11-24 12:43:18.627', 'mysql', 2, '第一篇博客', '', '123asdawdaw', 0, 0);
INSERT INTO `article` VALUES (3, '2022-12-07 12:39:20.000', '2022-12-07 15:57:52.631', NULL, 'java应用', 5, '对java的基本使用', '哒哒哒哒哒哒哒哒', 'http://rlwhi14je.hd-bkt.clouddn.com/FhyfwhGajnJxeFyriKp7sCVx4H1h', 0, 22);
INSERT INTO `article` VALUES (4, '2022-12-07 15:54:40.584', '2022-12-07 15:56:36.651', NULL, 'java使用', 5, '这是一个java的环境配置功能', '收下看看哒哒哒哒哒哒哒哒收下看看哒哒哒哒哒哒哒哒收下看看哒哒哒哒哒哒哒哒收下看看哒哒哒哒哒哒哒哒', 'http://rlwhi14je.hd-bkt.clouddn.com/Fp8Fyx8WY2H3DpfkuFelwbpQ17Qi', 0, 19);
INSERT INTO `article` VALUES (5, '2022-12-09 16:02:59.121', '2022-12-09 16:02:59.121', NULL, 'go笔记', 4, '这是一个简单的go程序', '这是一个简单的go程序这是一个简单的go程序这是一个简单的go程序', 'http://rlwhi14je.hd-bkt.clouddn.com/FqnldZVIs3YRbNC-7SKgChQ_enD1', 0, 2);
INSERT INTO `article` VALUES (6, '2022-12-09 18:23:48.411', '2022-12-09 18:23:48.411', NULL, 'go的多线程', 4, '这是一篇关于golang的多线程文章', '这是一篇关于golang的多线程文章', 'http://rlwhi14je.hd-bkt.clouddn.com/FqTAfwJrx40skCjOGSh5skbfmOzw', 0, 19);
INSERT INTO `article` VALUES (7, '2022-12-09 19:47:22.286', '2022-12-09 19:47:22.286', NULL, 'bs与cs架构', 3, 'bs与cs架构，基于app的两种架构进行比较', 'bs与cs架构，基于app的两种架构进行比较', 'http://rlwhi14je.hd-bkt.clouddn.com/FhyfwhGajnJxeFyriKp7sCVx4H1h', 0, 8);
INSERT INTO `article` VALUES (8, '2022-12-09 20:59:29.035', '2022-12-09 20:59:29.035', NULL, '博客', 8, '这是一篇文章', '苹果造车，这个业界公开的秘密，虽然从未对外官宣过什么，但通过各种媒体爆料和知情人透露等消息，足以拼凑出这个长达八年的项目都经历了哪些动荡。\n\n2014 年苹果正式启动的 Project Titan 计划，一年内便招募了超过 1000 名汽车专家和工程师，计划如 Mac 和 iPhone 一样，从零开始打造一款颠覆行业的汽车产品，为此还让当时苹果首席设计官 Jonathan Ive 也负责了车辆的设计工作。\n\n但不久之后，Project Titan 在推进过程中就遇到了分歧：是要制造整车，开发一辆具备半自动驾驶功能的汽车？还是侧重软件，打造一款全自动驾驶平台？\n\nProject Titan 的第一任负责人是 Steve Zadesky，由于他有过传统车企工作经历，因此在 Steve Zadesky 领导时期，Project Titan 的目标就是造整车。后来 2016 年 1 月，Steve Zadesky 宣布离职，Project Titan 也一度搁浅。\n\n2016 年 7 月，苹果返聘了退休 4 年的前硬件高级副总裁 Bob Mansfield 接管 Project Titan，而他选择专注研发无人驾驶系统，解雇了数十位负责硬件研发的员工——这意味着 Steve Zadesky 先前的积累白费，一切推倒重来。\n\n可能现在看来，项目研发方向发生如此大的转变颇为“儿戏”，但究其原因，或许也有库克的支持：“我认为未来软件将成为汽车上越来越重要的组件，自动驾驶也将变得更加重要。苹果专注于自动驾驶系统，这是非常重要的核心技术。”\n\n但 2018 年 8 月，苹果又将曾主导 Model 3 量产的特斯拉副总裁 Doug Field 挖来，与 Bob Mansfield 共同负责 Project Titan。此举令业界又开始怀疑，苹果似乎仍未放弃制造整车的愿景。\n\n到了 2020 年 12 月，Bob Mansfield 从苹果二度退休，Project Titan 负责人变成苹果机器学习与 AI 战略高级副总裁 John Giannandrea，没有硬件制造相关经验的他，自然延续自动驾驶系统研发路线。再之后，2021 年 9 月 Apple Watch 负责人 Kevin Lynch 又被任命接管 Project Titan 的开发工作——Project Titan 项目启动不过八年，Kevin Lynch 已是第五任项目负责人。\n\n\n\n被现实打败的理想，苹果主动降级\n\n除了项目负责人不断变动带来的管理和战略混乱，尽管后期苹果开始更专注于自动驾驶汽车的底层技术，但似乎由于目标制定得太高，开发起来也阻碍重重。\n\n据彭博社报道，此前苹果计划开发一款完全自主的自动驾驶汽车，即提供 L5 级自主性，该级别为自动驾驶技术的巅峰：\n\n\n\nL5 级是完全自动驾驶，这意味着完全不需要驾驶员介入操控，车上也没有方向盘、油门、刹车等操作部件，仅通过车载电脑的感知和运算来驾驶车辆。而目前，还没有任何一家汽车制造商能达到这一水平。\n\n可以理解，在开发出了 Mac 和 iPhone 这些颠覆时代的设备产品后，苹果自然会想推出一款各方面都与众不同的智能汽车。但理想很丰满，实际开发起来却“骨感”满满。\n\n据了解，Project Titan 在过去几个月一直处于停滞状态，因为苹果终于认清了现实：就目前的技术水平而言，想要开发一款完全自动驾驶、没有方向盘和踏板的汽车，并不可行。\n\n对此，外媒 The Information 曾分析称，苹果在造车方面的主要挑战在于，它决定发展自己的汽车工程知识，而不是利用这几十年来汽车公司积累下来的现有经验。\n\n不论如何，知情人士最新透露，Project Titan 的研发方向已再次发生重大转变——苹果计划推出一款具有方向盘和踏板的汽车，完全自动驾驶功能也会有，但仅限于在高速公路上激活，大体类似于通用汽车 Super Cruise 和福特 BlueCruise 等的驾驶辅助系统。\n\n由于自动驾驶功能标准的下调，苹果也将降低汽车定价，原本预计每辆车的售价将超过 12 万美元，现在的目标是尽量将价格控制在低于 10 万美元（约 69.7 万人民币）的水平。\n\n\n\n马斯克：特斯拉的最大竞争是苹果\n\n虽然完全自动驾驶的愿望破灭，但毕竟已有八年积累，苹果也并非什么成果都没有。\n\n据彭博社表示，苹果计划通过一个代号为 Denali 的强大车载计算机系统为汽车提供动力，该系统使用的处理器由苹果自己的芯片团队研发，性能相当于“大约 4 个苹果最高端 Mac 芯片的总和”。目前，这款芯片几乎已可以投入生产，只是苹果可能还在尝试缩小规模以降低成本。\n\n与特斯拉不同（今年 6 月，特斯拉宣布不再在其自动驾驶传感器套件中使用超声波传感器，改用仅有摄像头的“Tesla Vision”系统），苹果的自动驾驶系统将借助激光雷达和雷达传感器以及摄像头的组合，以确定汽车位置、行驶路线，并评估车辆距离其他物体和人有多远等信息。除此之外，苹果也正在探索建立一个远程指挥中心，以便在紧急情况下从远程协助司机并控制汽车。\n\n基于以上消息，不少网友再次对苹果汽车展开讨论，关注的角度也各不相同：\n\n“苹果在 iPod 和后来的 iPhone 上都取得了很好的成绩，而作为造车的后来者，我不认为他们会因为没想出一些独特而引人注目的东西而降低标准。”\n\n“无论采取何种形式，我都希望它能在 2026 年推出，不要再超过这个日期了。”\n\n“很明智的决定。马斯克总是承诺说 6 个月后实现，但完全自动驾驶可能还需要几十年才能达到真正的可行性。我无法接受特斯拉自动驾驶系统的安全性，这对完美主义者的苹果来说应该同样不能接受。”\n\n时至今日，苹果都未曾正面官宣过有关造车的动势，但即便一辆车都还没见着，也早已引起许多车企的重视，像马斯克在 2016 年就曾说：“特斯拉的最大竞争对手不是谷歌，而是苹果公司。”\n\n如今看来，这场特斯拉与苹果之间的大战，或许将会在 2026 年拉开序幕。\n\n参考链接：\n\nhttps://www.bloomberg.com/news/articles/2022-12-06/apple-scales-back-self-driving-car-and-delays-launch-until-2026?srnd=premium\n\nhttps://www.theverge.com/2022/12/6/23496789/apple-car-cost-self-driving-project-titan\n\n\n\n\n\nCSDN\n\n微信公众号\n\n成就一亿技术人\n\nCSDN资讯\n关注\n\n2\n\n\n0\n\n\n1\n\n专栏目录\n2019年中国自动驾驶行业报告：互联网企业与整车厂商互有优势\n科技D人生\n 8344\n1-1 自动驾驶定义及分级 自动驾驶在人工智能和汽车产业的飞速发展下已成为业内外关注的焦点，依据美国汽车工程师协会（SAE）2014年制订的自动驾驶分级标准（按照自动驾驶对于汽车操纵的接管程度和驾驶区域），自动驾驶可分为L0-L5共六级。 1-2 自动驾驶发展阶段 1-3 自动驾驶优势 1-4 自动驾驶应用场景 我国的无人驾驶是从1992年国防科技大学成功研...\n自动辅助驾驶标定反射板\nJYGD686868的博客\n 65\n随着汽车电子化和高级辅助驾驶技术的快速发展，自动驾驶作为辅助驾驶技术的高级阶段，俨然成为未来解决交通出行的重要方式，已成为全球范围内的一个新的技术研究热点和重点。级具备了综合干预辅助类功能，包括自动加速、自动刹车、自动转向等，处于L3级的车辆系统已经能够依靠自身传感器来感知周围驾驶环境，但是监控任务仍然需要人类驾驶员来主导，在紧急情况下仍然需要人类驾驶员进行干预。级即全自动驾驶，L5不需要驾驶员，也不需要任何人来干预方向盘和油门、刹车等，也不局限于特定场景的驾驶，可以适应任意场景和环境下的自动驾驶。\n特斯拉设计师评苹果造车：痴人说梦，缺乏创新\n开源精选\n 7816\n尽管特斯拉和苹果看似是两个完全不相干的公司，处于两个不同的领域，但两者一直看对方不顺眼。这其中除了两家公司CEO间的“爱恨情仇”以外，苹果涉猎汽车行业这一动作也是重要原因之一。本周，特斯拉首席设计师霍兹豪森在接受采访时便吐槽苹果的产品缺乏创新，并表示苹果在这一方面不会再有什么突破。\n汽车自动驾驶产业链深度研究报告：自动驾驶驶向何方\n喜欢打酱油的老鸟\n 1万+\n（报告出品方/作者：国金证券，翟炜） 报告综述 产业链与市场空间：当前我国自动驾驶正处于 L2 向 L3 级别转化的阶段，预 计 2025 年 L2.5 级别自动驾驶车辆渗透率为 50%，2030 年 L2.5 和 L4 级别 自动驾驶汽车渗透率分别将达 70%和 18%。从产业链上看，仅上游（感知层、传输层、决策层、执行层）和中游平台层，到 2025 年新增市场空间达 3088 亿元，2030 年可达 7020 亿元，10 年复合增速为 27%。 发展路径与核心参与方：技术路径上看，欧美等国鉴于其道\n美国公布自动驾驶新政\"AV4.0\"；微软Access数据库出现漏洞，或致8.5万家企业面临风险；苹果谈论隐私问题……...\nCSDN业界要闻\n 2841\n戳蓝字“CSDN云计算”关注我们哦！嗨，大家好，重磅君带来的【云重磅】特别栏目，如期而至，每周五第一时间为大家带来重磅新闻。把握技术风向标，了解行业应用与实践，就交给我重磅君吧！重磅先...\n第六十八篇：从ADAS到自动驾驶（一）：自动驾驶发展及分级\nliaojiacai的博客\n 2万+\n从ADAS到自动驾驶（一）：自动驾驶的发展及分级 从今天起，我将根据自己所接触的ADAS和无人驾驶技术，来写一写无人驾驶的基本知识，主要是帮助自己总结，还有是自己做了一些工作，这里就当做是用来保存的笔记。本人还在读研，所以有些知识还不足，希望大家多多指点，共同进步！！！ 我将会按照下面的文章顺序来写，当然中途可能会有变化： 从ADAS到无人驾驶（一）：自动驾驶的发展及分级 从ADAS到自动\n外媒：华为正与汽车厂商合作 最快2021年推出自动驾驶汽车\nCSDN头条\n 3688\n【TechWeb】6月12日消息，据国外媒体报道，自动驾驶是近几年汽车行业的一大热点，除了福特、丰田等传统的汽车厂商，特斯拉等新兴汽车厂商也有涉足。 而自动驾驶研发方面的重要力量还是苹果、谷歌、三星、Uber等电子、互联网方面的巨头，苹果的自动驾驶汽车计划在2016年就已浮出水面，其CEO库克在当年也松口承认他们在研发自动驾驶系统...\n苹果2019年财报数据：年收入2600亿美元，市值1.3万亿美元\ncaslees的博客\n 2万+\n听说苹果下调出货量了，我不禁好奇，苹果一年到底挣多少钱。 大数据爬一下！向大家汇报下结果： 雇员数量13.7万人 Employees: 2k (This Site) 137k (All Sites) 一共有727个子公司 Corporate Family: 727 Companies 根据2019年财报，年收入2600亿美元！！！全部资产规模为3380亿美元，市值为1.3万亿美元。 ...\n工程经理离职，苹果自动驾驶汽车项目再遇“减速带”\nweixin_64917227的博客\n 3725\n造车计划还能如期进行吗？\n汽车部门主管被福特挖走，苹果造车项目受挫\nsuper111t的博客\n 3191\n苹果首席汽车官加盟福特\n百度自动驾驶新突破：获首批T4牌照，升级Apollo 5.0，将进行复杂城市场景路测...\nAI科技大本营\n 3904\n作者 | KYLE WIGGERS等编译 | 夕颜出品 | AI科技大本营（ID:rgznai100）最近，百度自动驾驶项目终于有了进展。先是上周悄然发布了 Apoll...\n消息称苹果最快将于2022年推出折叠屏iPhone\nm0_46163918的博客\n 4607\n苹果对于折叠屏的态度慎之又慎，除了苹果一向对新技术比较谨慎之外，如果折叠屏版的iPhone一旦问世，极有可能侵占iPad乃至部分Macbook的市场。但是最近越来越多的消息和新专利正在透露出苹果正在积极跟进折叠屏，苹果可能2022年推出可折叠iPhone。 据报道，由于三星电子已经推出了三款使用柔性OLED面板打造的可折叠智能手机，Digitimes Research认为，苹果很可能在2022年介入可折叠智能手机领域，进一步推动对柔性OLED显示屏的需求。苹果已经拥有多项与可折叠iPhone相关的专利。\nGoogle、苹果、亚马逊向“自动驾驶”发起进攻\nweixin_64917227的博客\n 7172\n汽车行业正处于大变革阶段，电动汽车开始挑战燃油汽车，智能、电动和自动驾驶是汽车的未来发展趋势，为车辆体验创造全新的可能性。从自动驾驶技术到娱乐和搜索领域，互联网科技巨头无疑都想和未来汽车这个“当红炸子鸡”取得合作。下面，我们就来盘点一下谷歌、苹果和亚马逊为进军汽车行业做过的努力。 谷歌Android、AI等技术“重塑”传统汽车 今年2月份，谷歌与福特达成合作，签署了一项为期六年的合同。福特宣布从2023年开始，旗下的汽车和卡车都将预装谷歌地图、助手和游戏商店。福特首席执行官吉姆·法利称这..\n无人自动驾驶汽车的信息安全问题与汽车以太网安全防护\n博大汽车信息安全\n 4433\n  记得有一部电影生化危机里面的红后、以及复仇者联盟2里的人工智能奥创，它们都有一个中央控制中心系统，中央神经网络控制中心处理系统可以发送指令至终端（机器人、虚拟影像红后），在生化危机电影里面展示是红后全息影像的样子,在未来的自动驾驶汽车舱内的驾驶前方玻璃显示面板上会发生翻天腹地的变化，全息影像技术的显起，以车内摄像头共同辅助，通过影像声音与乘客进行对话，交互操作汽车指令。带来全新的驾驶生活体验。...\n人工智能之自动驾驶系列（一）：概要\n程序猿成长室\n 4万+\n人工智能之自动驾驶系列（一）：概要 版权声明：本文系个人经多处资料学习、吸收、整理而得，如需装载，请注明出处：作者名+链接。文中若有笔误或不正确的地方，烦请包涵并指出，谢谢。 内容说明：本系列内容大致包括自动驾驶概念、前沿动态、市场分析、应用场景、国家政策、技术框架、研究现状、典型方案、未来趋势与个人思考、动手实践简易版L3自动驾驶汽车等。 关键词：人工智能，自动驾\n华为表示年内没有推出搭载鸿蒙操作系统手机的计划；OpenStack或被抛弃？iPhone至少还要三年可苹果自研5G调制解调器……...\nCSDN业界要闻\n 5971\n关注并标星星CSDN云计算极客头条：速递、最新、绝对有料。这里有企业新动、这里有业界要闻，打起十二分精神，紧跟fashion你可以的！每周三次，打卡即read更快、更全了...\n为什么自动驾驶遇瓶颈，但自动代客泊车却很热？\n喜欢打酱油的老鸟\n 2万+\nhttps://www.toutiao.com/i6642090526684217870/   2019-01-03 10:23:32 文章来源：甲子光年 关注自动驾驶的人，可能会记得5年前大众旗下品牌奥迪的一则产品视频。 视频中，一位女士开着奥迪A8L在写字楼附近下车，她轻轻按了手机中的一个键，车就在无人驾驶的情况下自动来到地库并进入了车位。 等女士离开写字楼时，只需在上车点用手机一...\n11年的macbook还能用吗_8年老本的第二春：2011款Macbook Pro换血记\nweixin_39979245的博客\n 5988\n8年老本的第二春：2011款Macbook Pro换血记2019-03-24 00:33:2243点赞77收藏115评论小编注：此篇文章来自即可瓜分10万金币，周边好礼达标就有，邀新任务奖励无上限，点击查看活动详情先给8年老队友上个图：2011款13寸Macbook Pro，代号MC700CH/A基本参数，从度娘找了一下：上市时间是2011年2月，当时某宝找的香港代购(苹果以前新品上市从来不在内地...\n无人驾驶公司实力排名---自动驾驶初创企业排名（roadstar.ai、pony.ai、momenta、景驰和驭势科技等）\n热门推荐\n打怪升级ing\n 4万+\n企业类型 企业名称 成立时间 定位 定位 方案 专利数量 牌照 最新融资 国内初创公司 roadstar.ai 2017.5 L4 自动驾驶出租车队     有 1.28亿美元-A pony.ai 2016.12 L4 自动驾驶出租车队   2 有 1....\n3 万亿美元，苹果问鼎全球市值最高公司宝座\n一起来捉 Bug 呀~~\n 8138\n不到四年的时间里，苹果的市值翻了三倍，如何实现的？\n带你了解基于Ploto构建自动驾驶平台\n最新发布\n华为云官方博客\n 124\n华为云Solution as Code推出基于Ploto构建自动驾驶平台解决方案。\n“相关推荐”对你有帮助么？\n\n非常没帮助\n\n没帮助\n\n一般\n\n有帮助\n\n非常有帮助\n©️2022 CSDN 皮肤主题：代码科技 设计师：Amelia_0503 返回首页\n关于我们\n招贤纳士\n商务合作\n寻求报道\n\n400-660-0108\n\nkefu@csdn.net\n\n在线客服\n工作时间 8:30-22:00\n公安备案号11010502030143\n京ICP备19004658号\n京网文〔2020〕1039-165号\n经营性网站备案信息\n北京互联网违法和不良信息举报中心\n家长监护\n网络110报警服务\n中国互联网举报中心\nChrome商店下载\n账号管理规范\n版权与免责声明\n版权申诉\n出版物许可证\n营业执照\n©1999-2022北京创新乐知网络技术有限公司\n\nCSDN资讯\n\n码龄5年\n 企业员工\n4017\n原创\n-\n周排名\n153万+\n总排名\n5360万+\n访问\n\n等级\n45万+\n积分\n9万+\n粉丝\n8万+\n获赞\n3万+\n评论\n10万+\n收藏\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n私信\n关注\n\n热门文章\nWi-Fi 爆重大安全漏洞，Android、iOS、Windows 等所有无线设备都不安全了  453676\nPython读写Excel表格，就是这么简单粗暴又好用  350703\n8年经验面试官详解 Java 面试秘诀  233794\n我该用 Java 12 还是坚持 Java 11？  231958\n抛弃 Java 改用 Kotlin 的六个月后，我后悔了  177326\n最新评论\nChatGPT 玩「脱」了，写了份毁灭人类计划书，还遭到了 Stack Overflow 的封杀......\nFortunate瑞: 这文章质量怎么上的头条……烂的堪比营销号，不会是chatgpt写的吧？\n\n最强 AI ChatGPT 真要取代程序员？\n孤岛啊: 什么时候能出个取代人类的\n\nChatGPT 玩「脱」了，写了份毁灭人类计划书，还遭到了 Stack Overflow 的封杀......\n超高校级的作者: ChatGPT的回答比百度到的好太多了\n\n微软欲模仿“微信”，打造一款超级 App？\nWHO是大神: 在中国不太行，他们历来不会考虑中国本土化\n\n最强 AI ChatGPT 真要取代程序员？\n黑苹果用户: 汽车会取代马夫吗？不会吧，只是取代不愿意学车的马夫\n\n您愿意向朋友推荐“博客详情页”吗？\n\n强烈不推荐\n\n不推荐\n\n一般般\n\n推荐\n\n强烈推荐\n最新文章\nDevEco Studio 3.1差异化构建打包，提升多版本应用开发效率\nMindCon极客周 | 第四届如期而至，挑战硬核任务，C位出道赢万元激励 ！\n如何基于 APISIX 迭代数字智联平台\n2022\n12月\n32篇\n11月\n105篇\n10月\n136篇\n09月\n133篇\n08月\n185篇\n07月\n154篇\n06月\n171篇\n05月\n152篇\n04月\n152篇\n03月\n202篇\n02月\n41篇\n01月\n19篇\n2021年1493篇2020年3515篇2019年3311篇2018年1748篇2017年226篇\n分类专栏\n\n资讯\n1106篇\n\nAI\n33篇\n\n业界资讯\n244篇\n\n云计算\n19篇\n\n数据库\n21篇\n\n开源系列谈\n6篇\n\n开源\n86篇\n\n产业智能化\n6篇\n\n创造力\n1篇\n\n开发者\n4篇\n\n企业数字化转型\n3篇\n\n华为开发者大会2022\n1篇\n\n腾讯云\n2篇\n\n程序员\n49篇\n\n长沙·1024程序员节\n64篇\n\n数据安全\n13篇\n\n人工智能\n43篇\n\n大数据\n15篇\n\n近匠\n1篇\n\n开谈\n1篇\n\n源代码\n3篇\n\n智源\n2篇\n\n笔记\n8篇\n\n开发者大调查\n6篇\n\n人物志\n35篇\n\n开源中国开源世界高峰论坛\n6篇\n\n历史上的今天\n1篇\n\n迎战新型肺炎，互联网全面出击\n31篇\n\nCSDN黑板报\n10篇\n\n程序媛\n1篇\n\n全国大学生操作系统设计赛\n2篇\n\nCTO专访\n1篇\n\nAR\n1篇\n\n5G\n2篇\n\n智能化生活\n8篇\n\n云智慧\n1篇\n\n英特尔FPGA技术大会\n1篇\n\nCTO\n\n生物计算\n1篇\n\n2020 OPPO开发者大会\n1篇\n\nOPPO\n\n腾讯全球数字生态大会\n8篇\n\n百度翻译\n1篇\n\n云栖大会\n5篇\n\n智能网联汽车\n1篇\n\n百度大脑6.0\n1篇\n\n华为HMS生态\n2篇\n\n华为开发者大会\n2篇\n\n浪潮智能工厂\n1篇\n\nOpenCV\n1篇\n\n智能全感知系统\n1篇\n\n百度智能云\n1篇\n\nOpenInfra Days China 2020\n2篇\n\n世界人工智能大会\n4篇\n\nAI ProCon 2020\n1篇\n\n李跃森\n1篇\n\n嵌入式智能国际大会\n16篇\n\nCSDN 在线峰会\n2篇\n\n问底中国 IT 技术演进\n7篇\n\n开源操作系统年度技术会议\n5篇\n\n产品见闻\n97篇\n\n技术之路\n239篇\n\n程序人生\n73篇\n\n行业热点\n319篇', 'http://rlwhi14je.hd-bkt.clouddn.com/FrYYv1EUb-0f3ImhxaVbkq8bTDmW', 0, 14);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (2, 'mysql');
INSERT INTO `category` VALUES (3, 'server');
INSERT INTO `category` VALUES (4, 'go');
INSERT INTO `category` VALUES (5, 'java');
INSERT INTO `category` VALUES (8, 'C');

-- ----------------------------
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `qqchat` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `wechat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `weibo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bili` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `img` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `icp_record` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES (1, 'luobao', '一个普通的程序员', '303773915', '303773915', '303773915', '303773915', '303773915', 'http://rlwhi14je.hd-bkt.clouddn.com/FqqPlkJjygP8HCp3hALbx98IA9Ia', 'http://rlwhi14je.hd-bkt.clouddn.com/FhzW79A6P2poRMuRLG-JaHxdRG7q', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '2022-11-25 10:38:30.892', '2022-11-25 10:38:30.892', '2022-11-25 10:56:58.276', 'admin', '$2a$10$KwTTeQs5r8SxWQjAM5CH3OzSVSTpShszbGPvTUt/PTz0K7mMqGUDu', 0);
INSERT INTO `user` VALUES (2, '2022-11-25 10:55:27.782', '2022-12-09 15:59:30.288', NULL, 'admin1', 'dMsZG47rghO0/g==', 1);
INSERT INTO `user` VALUES (3, '2022-11-26 12:29:57.570', '2022-12-06 20:23:50.511', NULL, 'admin2', 'dMsZG47rghO0/g==', 1);
INSERT INTO `user` VALUES (4, '2022-12-04 14:29:39.988', '2022-12-04 14:29:39.988', '2022-12-06 15:05:34.048', 'admin', 'dMsZG47rghO0/g==', 2);
INSERT INTO `user` VALUES (5, '2022-12-04 14:30:05.648', '2022-12-04 14:30:05.648', '2022-12-04 20:46:43.453', 'admin3', 'dMsZG47rghO0/g==', 3);
INSERT INTO `user` VALUES (6, '2022-12-04 14:30:27.922', '2022-12-04 14:30:27.922', '2022-12-04 20:46:47.308', 'admin4', 'dMsZG47rghO0/g==', 2);
INSERT INTO `user` VALUES (7, '2022-12-04 15:55:09.725', '2022-12-06 19:40:09.938', NULL, 'admin5', 'dMsZG47rghO0/g==', 1);
INSERT INTO `user` VALUES (8, '2022-12-04 15:55:18.102', '2022-12-04 15:55:18.102', '2022-12-04 20:55:39.926', 'admin6', 'dMsZG47rghO0/g==', 2);
INSERT INTO `user` VALUES (9, '2022-12-04 15:55:22.575', '2022-12-04 15:55:22.575', '2022-12-06 14:40:35.555', 'admin7', 'dMsZG47rghO0/g==', 2);
INSERT INTO `user` VALUES (10, '2022-12-04 15:55:26.992', '2022-12-06 19:33:16.154', '2022-12-07 19:53:05.014', 'admin8', 'dMsZG47rghO0/g==', 1);
INSERT INTO `user` VALUES (11, '2022-12-04 15:55:31.297', '2022-12-04 15:55:31.297', '2022-12-06 15:21:07.832', 'admin9', 'dMsZG47rghO0/g==', 2);
INSERT INTO `user` VALUES (12, '2022-12-06 13:35:53.815', '2022-12-06 13:35:53.815', '2022-12-06 15:47:31.611', 'user', 'dMsZG47rghO0/g==', 2);
INSERT INTO `user` VALUES (13, '2022-12-06 13:42:00.643', '2022-12-09 18:22:12.449', NULL, 'user120', 'dMsZG47rghO0/g==', 1);
INSERT INTO `user` VALUES (14, '2022-12-06 13:46:43.899', '2022-12-06 13:46:43.899', '2022-12-07 19:53:12.164', 'user2', 'dMsZG47rghO0/g==', 2);
INSERT INTO `user` VALUES (15, '2022-12-06 13:47:02.289', '2022-12-06 19:38:56.395', '2022-12-09 18:22:21.939', 'user3', 'dMsZG47rghO0/g==', 1);
INSERT INTO `user` VALUES (16, '2022-12-06 13:48:22.594', '2022-12-06 19:30:34.642', '2022-12-09 18:22:29.929', 'user4', 'dMsZG47rghO0/g==', 0);
INSERT INTO `user` VALUES (17, '2022-12-06 13:49:38.275', '2022-12-09 18:23:01.743', '2022-12-09 18:35:44.088', 'test', 'dMsZG47rghO0/g==', 1);
INSERT INTO `user` VALUES (18, '2022-12-06 14:19:38.079', '2022-12-06 14:19:38.079', '2022-12-09 18:42:05.469', 'user123', '2y8Fg5SzlSVp0w==', 2);
INSERT INTO `user` VALUES (19, '2022-12-06 14:20:16.669', '2022-12-06 14:20:16.669', NULL, 'boby', 'Bur2H40FMEk/Rg==', 2);
INSERT INTO `user` VALUES (20, '2022-12-06 14:23:17.251', '2022-12-06 14:23:17.251', NULL, 'lily', '/TKwaD4ZOcRC6Q==', 2);
INSERT INTO `user` VALUES (21, '2022-12-06 15:21:37.073', '2022-12-06 15:21:37.073', NULL, 'user678', '/TKwaD4ZOcRC6Q==', 2);
INSERT INTO `user` VALUES (22, '2022-12-06 19:47:02.327', '2022-12-06 19:47:02.327', NULL, 'admin100', 'dMsZG47rghO0/g==', 2);

SET FOREIGN_KEY_CHECKS = 1;
