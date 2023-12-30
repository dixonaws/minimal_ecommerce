from chalice import Chalice

app = Chalice(app_name='shopapi')


@app.route('/')
def index():
    # _shop = [
    #     Product(name: "Sunglasses", price: 99.99, description: "Sunglasses", imagePath: "assets/sunglasses.png"),
    # Product(name: "Laptop", price: 5199.99, description: "Macbook Pro", imagePath: "assets/laptop.png"),
    # Product(name: "Bicycle", price: 8299.99, description: "Specialized Roubaix", imagePath: "assets/bike.png"),
    #
    # ]
    #
    lst_shop=[]
    dict_product0={}
    dict_product1 = {}
    dict_product2 = {}

    dict_product0['name']="Sunglasses"
    dict_product0['price']=99.99
    dict_product0['description']="Premium shades"
    dict_product0['imagePath']="assets/sunglasses.png"
    lst_shop.append(dict_product0)

    dict_product1['name'] = "Laptop"
    dict_product1['price'] = 5199.99
    dict_product1['description'] = "Macbook Pro"
    dict_product1['imagePath'] = "assets/laptop.png"
    lst_shop.append(dict_product1)

    dict_product2['name'] = "Bicycle"
    dict_product2['price'] = 8199.99
    dict_product2['description'] = "Specialized Roubaix"
    dict_product2['imagePath'] = "assets/bike.png"
    lst_shop.append(dict_product2)

    return lst_shop



# The view function above will return {"hello": "world"}
# whenever you make an HTTP GET request to '/'.
#
# Here are a few more examples:
#
# @app.route('/hello/{name}')
# def hello_name(name):
#    # '/hello/james' -> {"hello": "james"}
#    return {'hello': name}
#
# @app.route('/users', methods=['POST'])
# def create_user():
#     # This is the JSON body the user sent in their POST request.
#     user_as_json = app.current_request.json_body
#     # We'll echo the json body back to the user in a 'user' key.
#     return {'user': user_as_json}
#
# See the README documentation for more examples.
#
