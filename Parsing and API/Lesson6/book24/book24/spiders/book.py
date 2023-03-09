import scrapy
from book24.items import Book24Item

class BookSpider(scrapy.Spider):
    name = 'book'
    allowed_domains = ['book24.ru']
    start_urls = []
    
    with open('books.txt', 'r') as f:
        for n, line in enumerate(f, 1):
            start_urls.append(line.rstrip('\n'))

    def start_requests(self):
        for url in self.start_urls:
            yield scrapy.Request(url, self.parse)

    def parse(self, response):
        url_book = response.url	
        title = response.xpath('//h1[@class="product-detail-page__title"]/text()').get().split(':')[-1]
        price = response.xpath('//span[@class="app-price product-sidebar-price__price"]/text()').get()
        price_old = response.xpath('//span[@class="app-price product-sidebar-price__price-old"]/text()').get()
        author = response.xpath('//h1[@class="product-detail-page__title"]/text()').get().split(':')[0]
        rating = response.xpath('//span[@class="rating-widget__main-text"]/text()').get()
        
        book_item = Book24Item(url_book=url_book, title=title, price=price, price_old=price_old, author=author, rating=rating)
        yield book_item
