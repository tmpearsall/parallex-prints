# The shop's products, as listed on Etsy (prices and links read from the public shop page on 2026-10-20).
# Each listing is a plain hash; there is no database. Edit this file when the Etsy shop changes.
class Catalog
  SHOP_URL = "https://www.etsy.com/shop/ParallexPrints".freeze
  EMAIL = "info@parallexprints.com".freeze

  ITEMS = [
    { key: :custom_coaster, section: "Coasters", title: "Personalized Custom Coaster", price: "$6.99", image: "products/personalized-custom-coaster.jpg", alt: "A round coral coaster with a name in white script", url: "https://www.etsy.com/listing/1898760691/personalized-custom-coaster-home-office", blurb: "Your name or words, in your choice of colors." },
    { key: :coaster_set, section: "Coasters", title: "Four-Piece Coaster Set with Holder", price: "$21.99", image: "products/four-piece-coaster-set.jpg", alt: "Four purple coasters in a matching holder", url: "https://www.etsy.com/listing/4439158747/four-piece-coaster-set-with-holder", blurb: "Four coasters and the holder that keeps them together." },
    { key: :dragon_fruit, section: "Art by Lena", title: "Dragon Fruit Coaster", price: "$10.99", image: "products/dragon-fruit-coaster.jpg", alt: "A round coaster printed with a painting of a dragon fruit", url: "https://www.etsy.com/listing/4344521907/dragon-fruit-coaster", blurb: "An original painting by Lena, printed as a coaster." },
    { key: :migraine, section: "Art by Lena", title: "Migraine Headache Coaster", price: "$10.99", image: "products/migraine-headache-coaster.jpg", alt: "A round coaster printed with an expressive painting of migraine auras", url: "https://www.etsy.com/listing/4344506415/migraine-headache-coaster-expressive-art", blurb: "Expressive art that shows what a migraine aura looks like." },
    { key: :hearts, section: "Art by Lena", title: "Lena's Hearts Coaster", price: "$10.99", image: "products/lenas-hearts-coaster.jpg", alt: "A round coaster printed with a painting of hearts", url: "https://www.etsy.com/listing/4344511117/lenas-hearts-coaster-artwork", blurb: "Hearts, painted by Lena." },
    { key: :watch_small, section: "Watch stands", title: "Personalized Small Apple Watch Stand", price: "$11.99", image: "products/apple-watch-stand-small.jpg", alt: "A blue Apple Watch charging stand with a name on the base", url: "https://www.etsy.com/listing/1898776029/personalized-small-apple-watch-stand", blurb: "A charging dock with your name on the base." },
    { key: :watch_tall, section: "Watch stands", title: "Tall Apple Watch Stand", price: "$13.99", image: "products/apple-watch-stand-tall.jpg", alt: "A tall red Apple Watch charging stand", url: "https://www.etsy.com/listing/1898782345/tall-apple-watch-stand-personalized", blurb: "The same dock, taller, with your own text." },
    { key: :card_holder, section: "For the office", title: "Business Card Holder with 20 Custom Business Cards", price: "$14.99", image: "products/business-card-holder.jpg", alt: "A purple business card holder with Parallex Prints cards", url: "https://www.etsy.com/listing/4338685710/customizable-business-card-holder-with", blurb: "A holder for the desk, with twenty cards made for you." },
    { key: :folder_plaque, section: "For the office", title: "Custom Folder Office Plaque", price: "$17.49", image: "products/office-folder-plaque.jpg", alt: "An office plaque in the shape of a folder", url: "https://www.etsy.com/listing/4338318117/custom-folder-office-plaque-personalized", blurb: "A personalized sign for an office or a door." },
    { key: :desk_sign, section: "For the office", title: "Desk Sign, Plaque or Name Tag", price: "$13.49", image: "products/desk-sign-name-tag.jpg", alt: "A curved desk sign with a business name", url: "https://www.etsy.com/listing/1885240520/sign-plaque-name-tag-desk-accessory", blurb: "A desk accessory for your name, your brand or your message." },
    { key: :tray, section: "Home", title: "Custom Modern Serving Tray", price: "$14.99", image: "products/serving-tray.jpg", alt: "A modern serving tray with a circle cutout", url: "https://www.etsy.com/listing/1884584460/custom-modern-serving-tray-with-circle", blurb: "A serving tray with a circle cutout, printed to order." },
    { key: :cornucopia, section: "Home", title: "Cornucopia Horn of Plenty Set", price: "$19.99", image: "products/cornucopia-set.jpg", alt: "A pair of cornucopia horns in autumn colors", url: "https://www.etsy.com/listing/4397776031/cornucopia-horn-of-plenty-set", blurb: "A Thanksgiving and fall decoration set." }
  ].freeze

  def self.featured
    ITEMS.select { |i| %i[custom_coaster watch_small card_holder dragon_fruit].include?(i[:key]) }
  end

  def self.sections
    ITEMS.group_by { |i| i[:section] }
  end

  def self.lena
    ITEMS.select { |i| i[:section] == "Art by Lena" }
  end
end
