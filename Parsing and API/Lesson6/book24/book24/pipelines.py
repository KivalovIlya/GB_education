from itemadapter import ItemAdapter
import pymongo

class MongoDBPipeline:

    def __init__(self, mongo_uri, mongo_db, mongo_coll):
        self.mongo_uri = mongo_uri
        self.mongo_db = mongo_db
        self.mongo_coll = mongo_coll
    
    @classmethod
    def from_crawler(cls, crawler):
        return cls(
            mongo_uri=crawler.settings.get("MONGO_URI"),
            mongo_db=crawler.settings.get("MONGO_DATABASE", "books24"),
            mongo_coll=crawler.settings.get("MONGO_COLL_QUOTES", "book"),
        )

    def open_spider(self, spider):
        self.client = pymongo.MongoClient(self.mongo_uri)
        self.db = self.client[self.mongo_db]
        self.collection = self.db[self.mongo_coll]

    def close_spider(self, spider):
        self.client.close()
        
    def process_item(self, item, spider):
        item_dict = ItemAdapter(item).asdict()
        self.collection.insert_one(item_dict)
        return item