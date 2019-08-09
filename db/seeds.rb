# This file will automatically load 8 products into our database for us to play with.
# Import with rake db:seed

products = [
  { attributes: {
      title: 'Tinfoil Hat',
      sku: 'NG45636',
      price: 7.99,
      description: "Preserve free thought! Protect your mind from dangerous radio waves and other highly-suspect technologies used by suscpicious government mind-control programs. Made from durable tin with a comfortable interior lining. Does not protect against visual mind-control tech such as submliminal messages in TV and advertising. You'll need goggles for that.",
      specs: "* Made from tin, not aluminum! Don't trust the knockoffs.
* Comfortable interior lining for extended wear.
* Guaranteed to protect your mind from bad influences.
* Secure chin strap.
* Adjustable band for any size head.",
    },
    image: 'tinfoil-hat.jpg'
  },
  { attributes: {
      title: 'Finger Tentacles',
      sku: 'NG71802',
      price: 3.49,
      description: "Do your fingers seem disappointingly small, pale, and, worst of all, human?  The solution is to hand with these finger tentacles.  This amazing product turns your human appendages into octopus-like extensions.  Apply as few or as many as necessary to bring excitement back into your life.",
      specs: "* Life-like, terrifying pink tentacles
* Fits comfortably on any size finger
* No animal products used in construction
* Turns your fingers into tentacles",
    },
    image: 'finger-tentacles.jpg'
  },
  { attributes: {
      title: 'Cozy Remote Holder',
      sku: 'NG00411',
      price: 14.99,
      description: "No more searching for your remote controls, now you can have a home for them all. Constructed of non-slip rubber this designer caddy stores up to four remote controls. This tasteful solution adds a visual splash of style to your living room!",
      specs: "* Holds up to four remotes
* Material: non slip rubber
* Dimensions 130 x 130 x 90 mm",
    },
    image: 'remote.jpg'
  },
  { attributes: {
      title: 'Unicorn Corn Holders',
      sku: 'NG64545',
      price: 14.99,
      description: "Unicorns, mythological beings of light and magic or perfectly adapted holders of corn? With these exquisitely sculpted horned ponies, you can have your corn and eat it too. This set comes with four pairs of unicorns, two for each cob. Dishwasher safe, these Unicorn corn holders will be a fantastical addition to your next corn-eating festivity.",
      specs: "* Dishwasher safe
* Fantastical for all ages
* Great for gift giving
* Comes in four magical colors
* Reuse again and again",
    },
    image: 'unicorn-corn-holders.jpg'
  },
  { attributes: {
      title: 'Pantone Toothbrush Set',
      sku: 'NG88322',
      price: 9.99,
      description: "Choose the color that suits you, your mood, your style, your personality, your signature. Pantone is a world renowned authority on color and these toothbrushes are no exception. Soft bristle and durable plastic are colored with Pantone's own color palette in red, yellow, blue, black and green. Perfect for yourself or to have on hand for overnight guests.",
      specs: "* Choose the color that suits you
* Each brush handle features a bright Pantone color
* Soft bristles and durable plastic handles
* Set of five brushes in red, yellow, blue, black and green",
    },
    image: 'toothbrush.jpg'
  },
  { attributes: {
      title: 'Wine Bottle Tote',
      sku: 'NG4327W',
      price: 19.99,
      description: "The Wine Bottle Tote insulates and protects one 750ml–1L bottle of wine. Made from neoprene, the wetsuit material - it cushions the bottle and insulates contents up to four hours, depending on external temperatures. Lightweight, portable soft-grip handles and stores flat or rolls up for convenient packing. Whether you prefer red or white, sparkling or still, the Wine Bottle Tote lets you go anywhere with your vino. They also make the perfect gift for your favorite oenophile or party host. ",
      specs: "* Neoprene 1-Bottle Tote
* Made of neoprene, the wetsuit material; vinyl and PVC free
* Holds one 750ml–1L bottle of wine; lightweight portable design folds flat; comfortable soft-grip handles; insulates up to four hours
* Machine wash cold and drip-dry; stain resistant
* Measures 6.1 x 15.6 x .4 inches when flat",
    },
    image: 'wine-holder.jpg'
  },
  { attributes: {
      title: 'Sesame Street Count Doll',
      sku: 'NG12345',
      price: 19.99,
      description: "Introducing Count, the newest Sesame Street character plush toy, encouraging children to learn numbers. Count has a soft body and is 14 inches tall; he wears a black suit jacket and a green and fuchsia satin cape. One, two, three&hellip; numbers are fun with Count!",
      specs: "* Satin cloak of red and green
* Soft and floppy design
* New character
* Perfect for both play and collecting
* For ages 12 months and above",
    },
    image: 'count.jpg'
  },
  { attributes: {
      title: 'Buddha Board',
      sku: 'NG11111',
      price: 24.99,
      description: "Calm your mind while creating beautiful images with this Zen-like Etch-a-Sketch. Use the included brush to paint designs onto the board with water. As the water evaporates your image will fade, but will reveal a new perspective on your creative endeavors, encouraging the Zen idea of living in the moment. Stand, board, and brush included.",
      specs: "* Board dimension 12 x 9 x 0.15 inches
* Environmentally friendly and lasts for years with proper care
* As the water evaporates, the image fades, generating new perspectives on creative endeavors
* Stand, board, and brush included
* Ages: three and up",
    },
    image: 'buddha-board.jpg'
  },
]

products.each do |product|
  if Product.find_by(sku: product[:attributes][:sku])
     puts "#{product[:attributes][:title]} already exists, skipping"
     next
  end
  p = Product.new(product[:attributes])
  fn = "public/img/product_images/#{product[:image]}"
  if File.exist? fn
    p.image.attach(io: File.open(fn), filename: product[:image])
  end
  if p.save
    puts "Created #{p.title}"
  end
end
