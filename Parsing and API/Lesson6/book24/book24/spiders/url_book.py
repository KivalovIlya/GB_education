import scrapy
from book24.items import Book24Item

class Url_bookSpider(scrapy.Spider):
    name = 'url_book'
    allowed_domains = ['book24.ru']
    pages = 379
    url = 'https://book24.ru/catalog/detektivy-1594/'
    start_urls = []
    for page in range(1, 379, 1):
        start_urls.append(url+'page-'+str(page)+'/')

    def start_requests(self):
        for url in self.start_urls:
            yield scrapy.Request(url, self.parse)

    def parse(self, response):
        urlbooks = []
        
        for book in response.xpath('//div[@class="product-card__content"]'):
            url = 'https://book24.ru' + str(book.xpath('./a/@href').get())
            urlbooks.append(url)
            
        with open('books.txt', 'a') as f:
            for url in urlbooks:
                f.writelines(url+'\n') 
            

