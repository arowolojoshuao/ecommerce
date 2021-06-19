import 'package:ecomers_app/models/categories.dart';
import 'package:ecomers_app/models/products.dart';

import 'cart.dart';

class AppBrain {
  static List<Product> mListItems = [
    Product(
        id: 0,
        price: 25.00,
        title: 'Sunset & Spring',
        image: [
          "https://images.bloomingdalesassets.com/is/image/BLM/products/3/optimized/9519123_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
          "https://images.bloomingdalesassets.com/is/image/BLM/products/8/optimized/9631048_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
          "https://images.bloomingdalesassets.com/is/image/BLM/products/4/optimized/9519124_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
          "https://images.bloomingdalesassets.com/is/image/BLM/products/5/optimized/9519125_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
          "https://images.bloomingdalesassets.com/is/image/BLM/products/1/optimized/9606851_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
        ],
        descrip: 'Embellished Denim Jacket - 100% Exclusive'),
    Product(
        id: 1,
        price: 70.00,
        title: 'Marc New York',
        image: [
          "https://images.bloomingdalesassets.com/is/image/BLM/products/9/optimized/10530639_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
          "https://images.bloomingdalesassets.com/is/image/BLM/products/5/optimized/10531755_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
          "https://images.bloomingdalesassets.com/is/image/BLM/products/4/optimized/11162904_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
          "https://images.bloomingdalesassets.com/is/image/BLM/products/9/optimized/11162909_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
          "https://images.bloomingdalesassets.com/is/image/BLM/products/0/optimized/11162910_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
        ],
        descrip: 'Marble Puffer Coat'),
    Product(
        id: 3,
        price: 45.00,
        title: 'Theory',
        image: [
          "https://images.bloomingdalesassets.com/is/image/BLM/products/5/optimized/11217055_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
          "https://images.bloomingdalesassets.com/is/image/BLM/products/6/optimized/11217076_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
          "https://images.bloomingdalesassets.com/is/image/BLM/products/7/optimized/11217077_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
          "https://images.bloomingdalesassets.com/is/image/BLM/products/4/optimized/11217074_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
          "https://images.bloomingdalesassets.com/is/image/BLM/products/8/optimized/11217078_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
        ],
        descrip: 'Clairene Shawl Coat Clairene Shawl Coat Clairene'),
    Product(
        id: 4,
        price: 33.00,
        title: 'McQ Alexander McQueen',
        image: [
          "https://images.bloomingdalesassets.com/is/image/BLM/products/8/optimized/11049978_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
          "https://images.bloomingdalesassets.com/is/image/BLM/products/9/optimized/11049979_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
        ],
        descrip: 'Tie Dyed Swallow Hoodie'),
    Product(
        id: 5,
        price: 52.00,
        title: 'McQ Alexander McQueen',
        image: [
          "https://images.bloomingdalesassets.com/is/image/BLM/products/9/optimized/10881849_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
          "https://images.bloomingdalesassets.com/is/image/BLM/products/0/optimized/10881850_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
        ],
        descrip: 'Chester Cotton Logo Graphic Sweatshirt'),
    Product(
        id: 6,
        price: 25.00,
        title: 'PAIGE',
        image: [
          "https://images.bloomingdalesassets.com/is/image/BLM/products/2/optimized/11077462_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
          "https://images.bloomingdalesassets.com/is/image/BLM/products/3/optimized/11077463_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
        ],
        descrip: 'Kenneth Pocket Tee'),
    Product(
        id: 7,
        price: 60.00,
        title: 'Tommy Bahama',
        image: [
          "https://images.bloomingdalesassets.com/is/image/BLM/products/2/optimized/11157812_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
          "https://images.bloomingdalesassets.com/is/image/BLM/products/3/optimized/11157813_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
        ],
        descrip: 'Flipshore Reversible Half-Zip Knit Pullover'),
    Product(
        id: 8,
        price: 22.00,
        title: 'Theory',
        image: [
          "https://images.bloomingdalesassets.com/is/image/BLM/products/0/optimized/11231220_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
          "https://images.bloomingdalesassets.com/is/image/BLM/products/1/optimized/11231221_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
          "https://images.bloomingdalesassets.com/is/image/BLM/products/4/optimized/11231224_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
          "https://images.bloomingdalesassets.com/is/image/BLM/products/2/optimized/11231222_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
          "https://images.bloomingdalesassets.com/is/image/BLM/products/3/optimized/11231223_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
        ],
        descrip: 'Cosmos Slub Cotton Essential Tee'),
    Product(
        id: 9,
        price: 85.00,
        title: 'Mackage',
        image: [
          "https://images.bloomingdalesassets.com/is/image/BLM/products/7/optimized/11072197_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
          "https://images.bloomingdalesassets.com/is/image/BLM/products/6/optimized/11072206_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
          "https://images.bloomingdalesassets.com/is/image/BLM/products/7/optimized/11072207_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
          "https://images.bloomingdalesassets.com/is/image/BLM/products/8/optimized/11072208_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
          "https://images.bloomingdalesassets.com/is/image/BLM/products/9/optimized/11072209_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
          "https://images.bloomingdalesassets.com/is/image/BLM/products/3/optimized/11204833_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
        ],
        descrip: 'Unisex Detachable Hood Down Kennie Jacket - Big Kid'),
    Product(
        id: 10,
        price: 30.00,
        title: 'SAM.',
        image: [
          "https://images.bloomingdalesassets.com/is/image/BLM/products/1/optimized/11106571_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
          "https://images.bloomingdalesassets.com/is/image/BLM/products/2/optimized/11106572_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
          "https://images.bloomingdalesassets.com/is/image/BLM/products/8/optimized/10487458_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
          "https://images.bloomingdalesassets.com/is/image/BLM/products/9/optimized/10487459_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
          "https://images.bloomingdalesassets.com/is/image/BLM/products/1/optimized/9951001_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
          "https://images.bloomingdalesassets.com/is/image/BLM/products/2/optimized/9951002_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
        ],
        descrip: 'Girls Soho Belted Puffer Jacket - Little Kid, Big Kid'),
  ];

  static List<Cart> mListCart = [
    Cart(
        id: 0,
        count: 3,
        price: 25.00,
        title: 'Sunset & Spring',
        image: [
          "https://images.bloomingdalesassets.com/is/image/BLM/products/3/optimized/9519123_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
        ],
        descrip: 'Embellished Denim Jacket - 100% Exclusive'),
    Cart(
        id: 1,
        count: 2,
        price: 70.00,
        title: 'Marc New York',
        image: [
          "https://images.bloomingdalesassets.com/is/image/BLM/products/9/optimized/10530639_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
        ],
        descrip: 'Marble Puffer Coat'),
    Cart(
        id: 3,
        count: 1,
        price: 45.00,
        title: 'Theory',
        image: [
          "https://images.bloomingdalesassets.com/is/image/BLM/products/5/optimized/11217055_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
        ],
        descrip: 'Clairene Shawl Coat Clairene Shawl Coat Clairene'),
  ];

  static List<Categories> mListCategories = [
    Categories(
      id: 0,
      title: 'Women',
      image:
          "https://images.bloomingdalesassets.com/is/image/BLM/products/8/optimized/9631048_fpx.tif?op_sharpen=1&wid=700&fit=fit,1&\$filtersm\$&fmt=webp",
    ),
    Categories(
      id: 1,
      title: 'Men',
      image: "https://sc04.alicdn.com/kf/HTB1KWcjeDTI8KJjSsphq6AFppXao.jpg",
    ),
    Categories(
      id: 3,
      title: 'Kids',
      image:
          "https://ae01.alicdn.com/kf/HTB1T5M2JL9TBuNjy1zbq6xpepXaH/Children-Clothes-2020-Summer-Baby-Boys-Clothes-Shirt-Shorts-Outfit-Kids-Clothes-Boys-Sport-Suit-Toddler.jpg",
    ),
    Categories(
      id: 4,
      title: 'Baby\'s',
      image:
          "https://qph.fs.quoracdn.net/main-qimg-091b80b4585142a8da836a67b5f9ab16",
    ),
    Categories(
      id: 5,
      title: 'Jeans',
      image:
          "https://i.pinimg.com/564x/7b/4a/de/7b4adea3500b26f9d43fc15e0be0e162.jpg",
    ),
  ];
}
