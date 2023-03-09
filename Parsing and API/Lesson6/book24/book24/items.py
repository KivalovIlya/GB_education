import scrapy


class Book24Item(scrapy.Item):
    title = scrapy.Field()
    author = scrapy.Field()
    rating = scrapy.Field()
    url_book = scrapy.Field()
    price_old = scrapy.Field()
    price = scrapy.Field()
