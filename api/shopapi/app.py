from chalice import Chalice

app = Chalice(app_name='shopapi')


@app.route('/', methods=['GET'])
def index():
    lst_shop = []
    dict_product0 = {}
    dict_product1 = {}
    dict_product2 = {}

    dict_product0['name'] = "Sunglasses"
    dict_product0['price'] = 99.99
    dict_product0['description'] = "Premium shades"
    dict_product0['imagePath'] = "http://jpdixon-images.s3-website-us-east-1.amazonaws.com/sunglasses.png"
    lst_shop.append(dict_product0)

    dict_product1['name'] = "Laptop"
    dict_product1['price'] = 5199.99
    dict_product1['description'] = "Macbook Pro"
    dict_product1['imagePath'] = "http://jpdixon-images.s3-website-us-east-1.amazonaws.com/laptop.png"
    lst_shop.append(dict_product1)

    dict_product2['name'] = "Bicycle"
    dict_product2['price'] = 8199.99
    dict_product2['description'] = "Specialized Roubaix"
    dict_product2['imagePath'] = "http://jpdixon-images.s3-website-us-east-1.amazonaws.com/bike.png"
    lst_shop.append(dict_product2)

    return lst_shop

