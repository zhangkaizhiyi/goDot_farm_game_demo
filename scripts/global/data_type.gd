class_name DataType

# 相当于定义内部类，我只能这么理解了
enum Tool{
	None,
	AxeWood,#斧子砍树
	TillGround, # 犁地
	WaterCrops, #浇农作物
	PlantCorn,#种玉米
	PlantTomato,#种土豆
}


enum GrowState{
	Seed,
	Germination, #发芽
	Vegetative, #生长
	Reproduction,# 繁殖
	Maturity,#成熟
	Harvesting,#收获
}
