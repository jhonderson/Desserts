# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
category_image_url_list = [
  "http://www.ahhthesimplelife.com/wp-content/uploads/2014/02/Hermit-Bars.jpg",
  "http://www.rusticgardenbistro.com/wp-content/uploads/www.rusticgardenbistro.com-Vanilla-Bean-Snickerdoodles-Square.jpg",
  "http://i0.wp.com/bossjuice.com/wp-content/uploads/2015/02/bananacreampie.jpg?resize=500%2C500",
  "https://wherefoodis.files.wordpress.com/2012/09/tumblr_m9ozcyvhem1r78swm.jpeg?w=550",
  "http://www.brosgiantpizza.com/wp-content/uploads/2015/05/cheesecake_main11.jpg",
  "http://www.thehallacafactory.com/image/cache/data/tres_leches-500x500.jpg",
  "https://www.pamperedchef.com/medias/sys_master/hb3/hfa/9064484012062/Dessert_RecipeHeaders9_15_th.jpg",
  "http://dailywaffle.com/wp-content/uploads/2012/07/cinnamon-roll-front.jpg",
  "http://greatlakesgrinders.com/wp-content/uploads/2015/05/Cookies-500x500.jpg",
]
dessert_image_url_list = [
  ["http://www.gourmetfury.com/wp-content/uploads/2013/11/barlata-dessert-austin-texas-best-restaurant-food-melody-gourmet-fury.jpg",
   "http://cloud.graphicleftovers.com/19168/345208/desserts.jpg",
   "https://lynntazyyang.files.wordpress.com/2013/11/091113_1.jpg?w=529"],
  ["http://www.gourmetfury.com/wp-content/uploads/2010/01/mushroom9.png",
   "http://www.foodservicedirect.com/productimageslarge/OTF406682L.jpg",
   "https://www.sweetstreet.com/wp-content/uploads/2015/09/p-13131-the-big-blitz-with-snickers-online_10.jpg"],
  ["https://s-media-cache-ak0.pinimg.com/736x/9a/dd/c8/9addc830466cc005dc69f5d7c5fb6421.jpg",
   "http://www.churchillchina.com/sites/default/files/imagecache/news_image/articles/Ambience%20Overhead%20Medium%20Dessert_DARKGrey.png",
   "http://dailywaffle.com/wp-content/uploads/2012/07/cornmeal-biscuit-peach-cobbler-closeup1.jpg"],
  ["http://ecx.images-amazon.com/images/I/5166IivY-3L.jpg",
   "http://s3.amazonaws.com/listing-admin/attachments/53168da21d41c81388000525/medium/Fine%20Dining%20Desserts%20400011.jpg?1393986978",
   "https://s-media-cache-ak0.pinimg.com/736x/2f/de/72/2fde72e3d7900ba3769991faffc46082.jpg"],
  ["http://www.gourmetfury.com/wp-content/uploads/2010/01/napa8.png",
   "https://s-media-cache-ak0.pinimg.com/736x/7e/c0/c2/7ec0c229e429334bfeee43da918273f9.jpg",
   "https://s-media-cache-ak0.pinimg.com/736x/3f/7f/4f/3f7f4f4f45df7c66d62ead2cce111c0d.jpg"],
  ["http://g03.a.alicdn.com/kf/HTB1OBs4HFXXXXcyXVXXq6xXFXXX0/Gluten-Free-Wheat-Free-font-b-Gourmet-b-font-font-b-Desserts-b-font-.jpg",
   "http://3qhu4g2bnf9k1dgdzy39ecvm.wpengine.netdna-cdn.com/wp-content/uploads/2014/12/Paleo-Dessert-500x500.jpg",
   "https://lynntazyyang.files.wordpress.com/2013/11/031113_3.jpg?w=529"],
  ["http://spatulascorkscrews.typepad.com/.a/6a00e54fc086428833017ee6830c6a970d-500wi",
   "http://i01.i.aliimg.com/wsphoto/v0/32257030527/Everyday-Desserts-Made-font-b-Gourmet-b-font-.jpg",
   "http://www.bayharbor.com/bi/4c1d5b96-d364-4a3f-b22f-adfc0903004f.jpg"],
  ["https://www.sweetstreet.com/wp-content/uploads/2015/09/p-13115-oreo-online_14.jpg",
   "http://41.media.tumblr.com/c8ca4e0515aa6d0a3bb83a3813149a11/tumblr_nntts5Ufi61rv3ceyo1_500.jpg",
   "https://s-media-cache-ak0.pinimg.com/736x/c4/e8/b2/c4e8b293b3d62e4bc0515cd5e7b79ad5.jpg"],
  ["http://g01.a.alicdn.com/kf/HTB17bx0IXXXXXb8XXXXq6xXFXXXJ/-font-b-Gourmet-b-font-font-b-Desserts-b-font-quick-easy-delicious-The-font.jpg",
   "http://loveincmag.com/wordpress/wp-content/uploads/2013/11/maggie-austin-dean-and-deluca.jpg",
   "http://www.thefreshmarket.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/0/0/00213784000009.jpg"]
]

User.delete_all

# Creacion de usuarios. Para el primer usuario ->
#                         login: usuario1
#                         password: usuario1password
for i in 1..10
  password = "usuario#{i}password"
  User.create( username: "usuario#{i}",
  	email:"usuario#{i}@gmail.com", password: "usuario#{i}password",
  	first_name: "Nombre#{i}", last_name: "Apellido#{i}", is_admin: (i % 3 == 0 || i == 1) )
end

Dessert.delete_all
DessertsCategory.delete_all

index = 0

# Creacion de categorias.
category_image_url_list.each do |url|
  index += 1
  DessertsCategory.create( name: "Desserts Category #{index}",
  	image_url: url)
end

index = 0
cat_index = 0

categories = DessertsCategory.all
# Creacion de categorias.
categories.each do |category|
	dessert_image_url_list[cat_index].each do |url|
	  index += 1
	  Dessert.create( name: "Dessert #{index}",
	  	image_url: url, description: "Dessert Description #{index}.",
	  	retail_price: (10*index), wholesale_price: (10*index + 1), desserts_category_id: category.id)
	end
	cat_index += 1
end