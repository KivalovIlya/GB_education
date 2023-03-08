from pathlib import Path
import lxml
from lxml import html
import scrapy
import pymongo


class PerekrestokSpider(scrapy.Spider):
	name = "perekrestok"
	
	def start_requests(self):
		start_url = 'https://www.perekrestok.ru/cat/d?append=1'
		urls = []
		for page in range(1, 64, 1):
			urls.append(start_url+'&page='+str(page))
		for url in urls:
			yield scrapy.Request(url=url, callback=self.parse)

	def parse(self, response):
		div_tag = response.xpath("//div[@class='product-card__content']")
		client = pymongo.MongoClient('mongodb://localhost:27017')
		db = client.perekrestok 
		for el in div_tag:
			name = el.xpath("./div[@class='product-card-title__wrapper']/div/text()").get()
			price = el.xpath("./div[@class='product-card__control']/div[@class='product-card__price']/div/div[@class='price-new']/text()").get()
			db.promotions.insert_one({'name': name, 'price': price})   
        
