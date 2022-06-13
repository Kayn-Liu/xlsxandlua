local Language = {}

Language = {
	--BY_EnterRoomManager 进入房间
	[1] = "正在进入场...",
	[2] = "创建房间中...",
	[3] = "创建积分房失败...",
	[4] = "正在坐下...",
	[5] = "正在进入房间...",
	[6] = "您累计在线时间已满3小时，请您下线休息，做适当身体活动。您可以在补填防沉迷信息后继续游戏，点击“确定”进行补填。",

	--BY_Extend 大厅
	[20] = "亲朋捕鱼大乱斗:房号",
	[21] = "亲友房号:",
	[22] = " 比赛时长：",
	[23] = " 基础积分:",
	[24] = " 当前人数:",

	--BY_GameRedPacket 红包
	[30] = "清凉夏日红包活动开启。VIP≥5级或充值领取了新手礼包的玩家完成任务即可领取3次“夏日红包”,可能获得<color=#C23D05FF>微信红包、金币、手游礼票奖励</color>！6月23日激情开启！",
	[31] = "确定",
	[32] = "恭喜玩家获得：",
	[33] = "奖励通过邮箱发放，请在大厅邮件中查看。",
	[34] = "红包转账发放，无需领取，请在微信零钱中查看。",
	[35] = "未知",
	[36] = "获取活动奖励数据失败",
	[37] = "访问web服务器失败",
	[38] = "正在获取活动奖励...",

	--BY_GameProp 鱼雷
	[50] = "请等待三叉戟结算完成再使用鱼雷",
	[51] = "鱼雷数量不足，捕获携带鱼雷的鱼有几率掉落",
	[52] = "是否确认使用“一键释放”释放您身上的<color=#E1661CFF>所有鱼雷</color>？",
	[53] = "ยิงระเบิดตอร์ปิโดล้มเหลว จำนวนระเบิดตอร์ปิโดไม่เพียงพอ",
	[54] = "鱼雷",
	[55] = "一键释放",

	--BY_GameTrident 三叉戟
	[70] = "ตอนนี้ชิปไม่เพียง",
	[71] = "ตอนนี้หอกตรีศูลพลังงานยังไม่เต็ม",
	[72] = "请等待鱼雷结算完成再使用三叉戟",
	[73] = "请等待三叉戟结算完成再使用三叉戟",
	[74] = "三叉戟收益",
	[75] = "กฏเกมหอกตรีศูล",
	[76] = "<color=#BD3C02FF>游戏方式:</color>捕获任意鱼，都可对三叉戟进行充能，",
	[77] = "鱼的分值越高充能越快。三叉戟能量满后，您可以选择不同的投入额度来释放三叉戟，博取获得更多筹码的机会，但也有可能输掉哦。",
	[78] = "VIP ≥  <color=#BD3C02FF>%d</color>  可以积累三叉戟之矛的能量 %d 管",
	--BY_BatteryManager 炮台
	[90] = "免费子弹不足，暂时关闭双倍捕获",
	[93] = "筹码不足以发射当前倍率子弹，是否前往商店购买？",
	[94] = "获取炮台数据失败，请重新进入房间",

	--BY_GameScratchCard
	[110] = "ฟรี",

	--BY_AwardBox
	[130] = "穿戴",
	[131] = "%d万",
	[132] = "确 定",
	[133] = "取 消",
	--BY_AwardRecord奖励记录
	[150] = "正在加载中",
	[151] = "数据太大，下载失败",
	[152] = "使用的炮台倍数越高，获得的奖金越高，显示最近50条大奖记录",
	[153] = "时间",
	[154] = "昵称",
	[155] = "奖池",
	[156] = "奖金",
	--BY_GamblingView 下注
	[170] = "大",
	[171] = "小",
	[172] = "是否投入金币%d,猜%s",
	[173] = "筹码不足，无法进入本轮游戏",

	--BY_GameView 
	[190] = "เชื่อมต่ออินเตอร์เน็ตไม่ได้ หลุดออกจากเซิร์ฟเวอร์ \nกรุณาล็อคอินเข้าใหม่",
	[191] = "กำลังเข้าสู่สนามชิป...",
	[192] = "您的筹码不足以进入这个房间!",
	[193] = "您的筹码不足以进入这个房间 จะเข้าสนามชิปเลือกหน้าอินเตอร์เฟซหรือไม่?",
	[194] = "ชิปที่ห้องทดลองใช้ได้แค่ในห้องทดลองเท่านั้น ไม่สามารถนำชิปออกไปห้องอื่นได้",
	[195] = "กดคลิก“<size=32><color=#FF0000FF>รีเซ็ต</color></size>”แล้ว，จะทำการรีเซ็ตค่าทั้งหมดในห้องทดลองของคุณแล้วเริ่มนับใหม่ ชิปทดลองรีเซ็ตเป็น<size=32><color=#FF0000FF>1ร้อยล้าน</color></size>",
	[196] = "รีเซ็ต",
	[197] = "取消",
	[198] = "รีเซ็ตชิปทดลอง",
	[199] = "หลังจากออกจากเมกแล้ว ต้องการเก็บรักษาไว้คงเดิมหรือไม่？".."\n".."ถ้าเลือก<color=#FF0000FF>【ไม่เก็บ】</color> จะทำการรีเซ็ตค่าทั้งหมดในห้องทดลองเป็น<color=#FF0000FF>ค่าเริ่มต้น</color>",
	[200] = "保存",
	[201] = "不保存",
	[202] = "立即前往",
	[203] = "โหมดสะสมคะแนนไม่สามารถออกระหว่างเกมได้",
	[204] = " 开启此功能",
	[205] = "是否跳转至超级世界杯？",
	[206] = "开启该功能后，将消耗双倍金币，同时获得双倍捕获率",
	[207] = "开启该功能后，点击屏幕上的鱼，可以锁定并持续攻击该目标",
	[208] = "正在同步服务器数据...",
	[209] = "获取超级世界杯数据失败",
	[210] = "正在进入超级世界杯...",
	[211] = "金币不足，无法开启自动攻击",
	[212] = "开启自动射击",
	[213] = "点击鱼之后可以锁定目标",
	[214] = "金币不足，无法开启该技能",
	[215] = "消耗双倍金币，发射两颗子弹",
	[216] = "穿透子弹可以打中一条直线上的所有鱼",
	[217] = "获取游戏服数据失败，请重新登录",
	[218] = "游戏内无法购买喇叭，请返回大厅商城购买",
	[219] = "由于长时间未操作，与服务器断开连接，\n请重新登录",
	[220] = "连接失败，请重新入场",	
	[221] = "竞技礼包加成已失效，是否前往购买?";
	--BY_GXFCCardShareView 刮刮卡
	[250] = "最高奖金",
	--BY_GXFCCardView 刮刮卡
	[251] = "批量兑换",
	[252] = "兑换",
	[253] = "正在获取兑奖数据",
	[254] = "请求数据超时，请检查网络",
	[255] = "卡片数量不足,请在快捷商城购买",
	[256] = "倍",
	[257] = "张",
	[258] = "您当前没有恭喜发财刮刮卡,请在右边快捷商店购买",
	[259] = "金币不足,购买失败",
	[260] = "购买成功！",
	[261] = "请耐心等待购卡结果...",
	[262] = "金币不足，是否前往商城充值",
	[263] = "正在购买恭喜发财刮刮卡...",
	[264] = "请耐心等待批量兑奖的结果...",
	[265] = "正在兑换奖励...",
	[266] = "是否确认消耗您身上%d张恭喜发财刮刮卡（最多可批量兑换50张）？",
	[267] = "祝福成语数量有错，当前存在个数:",
	[268] = "祝福组合",
	[269] = "倍数",
	[270] = "刮刮卡",
	[271] = "购买",
	[272] = "点亮3个福神",
	[273] = "才可触发财神",
	[274] = "祝福奖金：",
	[275] = "最高奖金3500W",
	[276] = "奖金基数",
	[277] = "中奖组合",
	[278] = "兑奖处",
	[279] = "<color=#9F9F9F>批量兑换</color>",
	[280] = "<color=#9F9F9F>兑换</color>",
	[281] = "再刮一次",
	[282] = "分享",
	[283] = "中奖记录",
	[284] = "这次没有中奖，祝您下次好运！",
	[285] = "剩余张数:",
	--BY_JinBiView
	[291] = "您的金币不足以进入该场，是否进入商店兑换？",
	[292] = "与服务器断开连接，无法进入房间",
	[293] = "今天体验次数已用完，请明天再来。",
	[294] = "今日剩余次数",
	[295] = "您的VIP等级不足以进入该场",
	--BY_LocationView
	[301] = "您的位置",

	[340] = "请求数据错误",
	[341] = "请求数据",
	[360] = "开",
	[361] = "关",
	[362] = "音效",
	[363] = "音乐",
	[365] = "游戏设置",
	--BY_RankListView排行
	[380] = "月",
	[381] = "日",
	[382] = "当前连胜：",
	[383] = "今日最高连胜：",
	[384] = "次",
	[385] = "<color=#FFE826FF>统计时间：还有%02d小时%02d分钟%02d秒</color>",
	[386] = "12月19日-21日连胜榜前5名的玩家,获得的<color=#FF0000FF>奖励翻倍</color>",
	[387] = "每日排名结算时间：次日00:00",
	--BY_RedPacketView 红包
	[400] = "条件未达成",
	[401] = "奖励已领取",
	[402] = "VIP≥5级或充值领取了新手礼包的玩家才可领取此活动奖励，玩金币类游戏可免费升级VIP！",
	[403] = "<color=#BA3D00FF>领取</color>",
	[404] = "<color=#373737FF>已领取</color>",

	--BY_ScratchAllView
	[420] = "第 ",
	-- [421] = " 张",
	--BY_ScratchCardView
	[430] = "免费刮刮卡数量不足，无法兑换",
	[431] = "是否确认使用“批量兑奖”消耗掉您身上%d张免费刮刮卡（最多可批量兑换50张）？。",
	[432] = "刮刮卡数量不足",
	[433] = "%d月%d日",
	[434] = "免费刮刮卡掉落时间：%s - %s",
	[435] = "免费刮刮卡使用期限：%s前",
	[436] = "免费刮刮卡数量：",
	[437] = "玩法说明：免费刮刮卡金币奖励数=金币区x倍数区，捕获任意鱼都有几率掉落免费刮刮卡。最高",
	[438] = "奖励为",
	[439] = "<color=#BD3C02>兑换</color>",
	[440] = "<color=#BD3C02>批量兑换</color>",
	--BY_SettingView设置
	[460] = "省电模式开启后，手机耗电量会减少，但可能会影响您的游戏手感。<color=#FF9600>请慎重开启！</color>",
	[461] = "开启",
	--BY_ShopView
	[480] = "充值成功！",
	[481] = "<color=#E1661CFF><size=33>%s点券</size></color> 兑换 <color=#E1661CFF><size=33>%s金币</size></color>?",
	[482] = "正在兑换中...",
	[483] = "兑换成功！",
	[484] = "兑换失败！",
	[485] = "购买点券时自动兑换金币",
	[486] = "确认兑换",
	[487] = "点券",
	[488] = "金币",
	[489] = "可兑换",
	--BY_TridentBet投注
	[500] = "金币不足,无法投该注",
	[501] = "<size=32>千</size>",
	[502] ="投入额度： ",
	[503] = "不投入",
	[504] = "当\n前\n排\n行",
	[505] = "连胜次数",
	[506] = "昵称",
	[507] = "第1名\n2000万金币",
	[508] = "第2名\n1000万\n金币",
	[509] = "第3-5名\n300万\n金币",
	[510] = "暂未有玩家上榜",
	[511] = "当前连胜：0次\n今日最高连胜：0次",
	[512] = "当天排行前5名的玩家可获得金币奖励。三叉戟单次投入100万才计入连胜。",
	[513] = "\n每日排名结算时间：次日00:00\n<color=#FFE826FF>统计时间：还有13小时44分钟47秒</color>",
	[514] = "我的成绩",
	[515] = "历\n史\n排\n行",
	[516] = "投入后，获得筹码是随机的，祝您好运哦！",
	[517] = "高级场下注额度更高 专家场最高投注为:2000k",

	--BY_WeaponView武器界面
	[521] = "VIP≥XX，开启此功能",--"仅会员开启，充值任意点券即可获得会员。",
	[522] = "前往充值",
	[523] = "x1倍~x100倍",
	[524] = "x10倍~x1千倍",
	[525] = "x100倍~x1万倍",
	[526] = "x1千倍~x2万倍",
	[527] = "x1倍~x2万倍",
	[528] = "温馨提示\n您当前VIP等级不够，无法获得该炮台。\n游戏内消耗金币，可提升VIP等级",
	[529] = "<color=#FF0000FF>体验金仅可在体验场使用！</color>",
	[530] = "级",
	[531] = "永久",
	[532] = "该炮台需到<color=red>中级场</color>解锁",
	[533] = "该炮台需到<color=red>高级场</color>解锁",
	[534] = "该炮台需到<color=red>专家场</color>解锁",
	[535] = "请求炮台数据",
	[536] = "请求炮台数据超时",
	[537] = "说明：游戏中点击炮台，可弹出本界面，重新选择大炮！",
	[538] = "请选择大炮",
	[543] = "黄金甲",
	[544] = "VIP专属，满身尽是黄金甲",
	[545] = "获得炮台",
	[546] = "VIP≥5",--"VIP≥5级",--"会员专属",
	[547] = "VIP≥18",--"VIP≥18",
	[548] = "高级VIP专属，浑身散发着贵族气息",
	[549] = "x1倍~x10倍",
	[550] = "x10倍~x100倍",
	[551] = "圣骑",
	--BY_LoadingView
	[570] = "提示：捕获任意鱼都可以给三叉戟充能，分值越高的鱼，充能越快哦！",
	[571] = "努力加载中，不消耗流量...",

	--BY_JackpotExplain 百万巨奖
	[591] = "                单人最高奖励可达  <color=#DF6B28>X 300</color>    \n击杀任意鱼，一定几率获得免费子弹并进入\n使用免费子弹的过程中，一定几率释放百万奖池。\n使用炮台倍数越高，获得奖池的金币越多。",
	[592] = "                单人最高奖励可达  <color=#DF6B28>X 800</color>    \n击杀任意鱼，一定几率获得免费子弹并进入\n使用免费子弹的过程中，一定几率释放千万奖池。\n使用炮台倍数越高，获得奖池的金币越多。",
	[593] = "                单人最高奖励可达  <color=#DF6B28>X 2999</color>     \n击杀任意鱼，一定几率获得免费子弹并进入\n使用免费子弹的过程中，一定几率释放亿万奖池。\n使用炮台倍数越高，获得奖池的金币越多。",	
	[594] = "筹码奖池游戏规则",
	--BY_FirstPayView
	[610] = "领 取",
	--BY_Extend
	[630] = "%02d天%02d时%02d分%02d秒",
	[631] = "%02d时%02d分%02d秒",
	--BY_GoldAward
	[640] = "倒计时:",
	[641] = "小福袋奖金",

	--BY_ActivityExplain
	[680] = "翻翻翻连胜榜规则",
	[681] = "活动规则:",
	[682] = "1.单次<color=#e1661c>投入 100 万</color>的三叉戟进入翻翻翻, 才会计入翻倍连胜。\n2.连胜只会在翻倍失败时中断, 主动退出或达到单个三叉戟翻倍次数上线退出, 不会中断连胜。\n3.连胜次数相同的玩家, 按达到次数时间排名, 先达到的排名靠前。\n4.排名会取玩家当天最好成绩, 当日连胜次数只参与当日排名。",
	[683] = "活动奖励:",
	[684] = "第%s名: ",
	[685] = "%d万",
	[686] = "领奖方式:",
	[687] = "1.翻翻翻连胜排行榜前5名金币奖励, 会在游戏内直接弹出。\n2.奖励<color=#e1661c>只保留3天</color>，若3天未上线领取，将无法获得该次奖励。",

	--BY_FishPay
	[690] = "购买方式",
	[691] = "微信",
	[692] = "支付宝",
	[693] = "商品：",
	[694] = "价格：",
	[695] = "元",

	--BY_GamblingView
	[700] = "结算",
	[701] = "最多可翻倍成功2次",
	--BY_GXFCAllView
	[702] = "卡序号",
	[703] = "组合奖金",
	[704] = "祝福奖金",
	[705] = "总金额",
	[706] = "本次刮卡总奖金：",
	--BY_GXFCRecordView
	[707] = "仅显示最近50条中奖记录",
	[708] = "总奖金",
	--BY_MessageBox
	[709] = "温馨提示",
	[710] = "是",
	[711] = "否",
	--BY_PrivateRecordView
	[712] = "房号",
	[713] = "玩家昵称",
	[714] = "玩家分数",
	[715] = "结算时间",
	--BY_RedPacketView
	[716] = "6月23日-24日，完成对应任务即可领取“<color=#FFEE33>夏日红包</color>”，打开可随机获得金币、手游礼票或<color=#FFEE33>微信现金红包</color>任一种！（VIP≥5级或<color=#FFEE33>充值领取了新手礼包</color>的账号可参与，VIP等级越高，获大奖概率越高。奖励领取截止于<color=#FFEE33>6月25日0点10分</color>，并通过邮件发放，请注意查收！）<color=#FFEE33>每个任务只能领取1次奖励。</color>",
	[717] = "昵称：",
	[718] = "VIP等级：",
	[719] = "只有已绑定服务号“<color=#FFEE33>亲朋游戏中心官网</color>”的账号才有概率获得<color=#FFEE33>微信现金红包</color>",
	--BY_ScratchAllView
	[720] = "卡序列",
	[721] = "倍数区",
	[722] = "金币区",
	--BY_SlotMachineView
	[723] = "其他",
	[724] = "奖金=炮台倍数x转盘倍数，万能牌可代替任何1张牌",
	[725] = "倍数：",

	[726] = "VIP1≥1或购买捕鱼礼包可永久解锁三叉戟",
	[727] = "VIP1≥1即可永久解锁三叉戟",
	[728] = "点击解锁三叉戟",
	[729] = "立即解锁",
	[730] = "即可解锁",
	[731] = "完成打鱼任务，解锁XX倍炮台",
	[732] = "点击解锁XX倍炮台",

	[733] = "五福熊猫炮",
	[734] = "高级VIP专属，五福临门，笑口常开",
	[735] = "温馨提示 \n 您当前VIP等级不够，无法获得该炮台。\n游戏内消耗金币，可提升VIP等级",

	[736] = "恭喜解锁X号炮台XX倍率",
	[737] = "恭喜解锁X号炮台",

	[738] = "恭喜解锁X号炮台XX倍率XX金币奖励",
	[739] = "恭喜解锁X号炮台XX金币奖励",

	[740] = "版本号: ",
	[741] = "系统维护中",
	[742] = " 秒",
	[743] = "เวลาคงเหลือในการยิง：",

	[744] = "สำเร็จภารกิจหรือ",
	[745] = "VIP≥1解锁",

	[746] = "1级大炮",
	[747] = "2级大炮",
	[748] = "3级大炮",
	[749] = "4级大炮",
	[750] = "5级大炮",

	[751] = "锁定设置",
	[752] = "勾选锁定鱼种，设置锁定范围。<color=#2494CC>点击</color>",
	[753] = "                                                                ，若有勾选鱼种，将会自动锁定勾选的鱼进行自动射击；若全不勾选，则需要手动点击鱼进行锁定捕捉。自动锁定开启后，点击鱼切换锁定目标。",
	[754] = "全选",
	[755] = "全不选",

	[756] = "翻倍成功",
	[757] = "翻倍失败",

	[758] = "元宝价值返还:",
	[759] = "暴击",
	[760] = "换桌中，请稍后",

	[761] = "幸运招财炮",
	[762] = "华丽专属特效，金币滚滚来",
	[763] = "\n获取炮台方法",
	[764] = "活动尚未开启，敬请期待！",

	[765] = "活动规则",
	[766] = "龙转盘抽奖中...",
	[767] = "点击停止:",

	[768] = "隐藏",
	[769] = "显示",

	[770] = "请求神龙转轮道具信息中...",
	[771] = "龙转盘道具使用中，请稍后再试",
	[772] = "神龙转盘道具抽奖中...",
	[773] = "您有道具未使用，是否前去使用？",
	[774] = "龙转盘道具不足，请购买礼包",
	[775] = "前去使用",
	[776] = "道具",

	[777] = "赤焰龙击炮",
	[778] = "华丽专属特效，龙转盘专属炮台",
	
	[779] = "幸运值",
	[780] = "消耗",
	[781] = "礼票",

	[782] = "四圣-朱雀炮台",
	[783] = "涅槃重生，爆裂射速 来自南方的圣兽归来",

	[784] = "升级失败会累积幸运值,幸运值满后可领取奖励",

	[785] = "四圣-白虎",
	[786] = "百兽之长，冰封万物 来自西方的圣兽归来",

	[787] = "花好月圆炮",
	[788] = "定知玉兔十分圆 化作霜风九月寒",
	
	[789] = "水枪炮台",
	[790] = "沙滩相聚 清凉一夏",
	

	ExitGame = "退出游戏",

	CommonWeaponConfig = {
		[1]={
			ratio = {
				[1]='x1เท่า~10เท่า',
				[2]='x10เท่า~60เท่า',
			},
			description = {
				[1]='การใช้ชิป x1\nรางวัลชิป x1',
				[2]='การใช้ชิป x10\nรางวัลชิป x10',
			}
		},
		[2]={
			ratio = {
				[2]='x10เท่า~100เท่า',
				[3]='x100เท่า~600เท่า',
			},
			description = {
				[2]='การใช้ชิป x10\nรางวัลชิป x10',
				[3]='การใช้ชิป x100\nรางวัลชิป x100',
			}
		},
		[3]={
			ratio = {
				[3]='x100เท่า~1kเท่า',
				[4]='x1kเท่า~6kเท่า',
			},
			description = {
				[3]='การใช้ชิป x100\nรางวัลชิป x100',
				[4]='การใช้ชิป x1000\nรางวัลชิป x1000',
			}
		},
		[4]={
			ratio = {
				[4]='x1kเท่า~10kเท่า',
				[5]='x10kเท่า~20kเท่า',
			},
			description = {
				[4]='การใช้ชิป x1000\nรางวัลชิป x1000',
				[5]='การใช้ชิป x10000\nรางวัลชิป x10000',
			}
		},
		[5]={
			ratio = {
				[4]='x1kเท่า~10kเท่า',
				[5]='x10kเท่า~20kเท่า',
			},
			description = {
				[4]='การใช้ชิป x1000\nรางวัลชิป x1000',
				[5]='การใช้ชิป x10000\nรางวัลชิป x10000',
			}
		},
	},


	NetWorkError = '服务器维护中 请稍后再试',
	moreClick = "多次点击，操作频繁",
	giftEnd = "每日充值礼包活动已结束",
	noTime = "今日购买次数已用完，请于明日0点后再来哦",

	awardPoolTitle = {
		[1] = "百万大奖",
		[2] = "千万巨奖",
		[3] = "亿万豪奖",
	},
	
	JumpHighArenaText1 = "您当前已经可以进入更刺激的中级场了。\n中级场解锁的“轰炸鲨、火龙神”，可触发<color=red>原子大轰炸、神龙转盘</color>\n是否立即前往？",
	JumpHighArenaText2 = "您当前已经可以进入更刺激的高级场了。\n高级场将解锁【<color=red>更高倍率</color>】，击杀鱼可获得【<color=red>丰厚筹码</color>】\n是否立即前往？",
	JumpHighArenaText3 = "您当前已经可以进入更刺激的财神场了。\n财神场解锁的“财神爷”，可触发<color=red>喜从天降</color>！\n是否立即前往？",
	JumpHighArenaText4 = "您当前已经可以进入更刺激的海神场了。\n海神场解锁的“海神”，有概率获得<color=red>海神三叉戟</color>\n是否立即前往？",
	JumpHighArenaText5 = "您当前已经可以进入更刺激的神仙场了。神仙场将解锁【<color=red>更高倍率</color>】，\n击杀鱼可获得更高筹码\n是否立即前往？",
	renderMode = {
		[1] = "省电",
		[2] = "低帧",
		[3] = "流畅",
		[4] = "华丽",
	},

	--BY_FishConfig
	bonusFishText = "奖金鱼",

	noRecord = "暂无得奖记录",

	shareGame = "分享",

	arenaName = {
		[1] = "初级场",
		[2] = "中级场",
		[3] = "高级场",
		[4] = "专家场",
		[5] = "海神之怒",
		[6] = "神仙场",
	},

	DoubleErrTips = {
		[10019] = '其他道具还在使用中，请稍后再试',
		[10004] = '当前筹码不足',
	},
}

return Language