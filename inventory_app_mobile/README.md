# inventory_app_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


<details>
<summary> Tugas 7 Pemrograman Berbasis Platform</summary>

</br>

# Tugas 7 Pemrograman Berbasis Platform
1. Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.

    Yang saya lakukan untuk bisa membuat program Flutter baru dengan tema Inventory seperti tugas-tugas sebelumnya yang bernama 'Inventory App' adalah melakukan `flutter create inventory_app_mobile` pada terminal. Setelah program dibuat, saya akan masuk ke program menggunakan Android Studio dan juga melakukan `cd inventory_app_mobile` pada terminal.

2. Membuat tiga tombol sederhana dengan ikon dan teks untuk:

    Sebelum bisa membuat tombol, saya perlu membuat overall program terlebih dahulu. Pada file `main.dart` di direktori `lib`, saya akan menambahkan kode berikut.

    ```
    import 'package:flutter/material.dart';
    import 'package:inventory_app_mobile/menu.dart';

    void main() {
    runApp(const MyApp());
    }

    class MyApp extends StatelessWidget {
    const MyApp({super.key});

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
            useMaterial3: true,
        ),
        home:MyHomePage(),
        );
    }
    }
    ```

    Kode ini ditujukan untuk membuat root (awalan) aplikasi. 

    [x] Tombol Untuk Melihat daftar item (Lihat Item), Menambah item (Tambah Item), Logout (Logout)

    Kode di bawah adalah overall kode untuk menambahkan tombol-tombol di atas beserta dengan Icons yang akan digunakan. Kode-kode ini ditulis pada file baru bernama `menu.dart` di direktori `lib`.
 
    ```    
    import 'package:flutter/material.dart';

    class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);

    final List<ShopItem> items = [
        ShopItem("Lihat Produk", Icons.checklist),
        ShopItem("Tambah Produk", Icons.add_shopping_cart),
        ShopItem("Logout", Icons.logout),
    ];
    }
    ```

    Agar kode bisa berfungsi dengan baik dan dapat dikustomisasi tampilannya, saya menambahkan kode Widget build di bawah method `final List<ShopItem> items`.

    ```
    @override
    Widget build(BuildContext context) {
        return Scaffold(
        // Overall app
        backgroundColor:Colors.orange[50], // Mengubah background color dari overall app
        appBar: AppBar(
            title: const Text(
            'Shopping List',
            style: TextStyle(
                color: Colors.white,
            ),
            ),
            backgroundColor:Colors.white,
        ),
        body: SingleChildScrollView(
            // Widget wrapper yang dapat discroll
            child: Padding(
            padding: const EdgeInsets.all(10.0), // Set padding dari halaman
            child: Column(
                // Widget untuk menampilkan children secara vertikal
                children: <Widget>[
                const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                    child: Text(
                    'Inventory App', // Text yang menandakan toko
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                    ),
                    ),
                ),
                // Grid layout
                GridView.count(
                    // Container pada card kita.
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: items.map((ShopItem item) {
                    // Iterasi untuk setiap item
                    return ShopCard(item);
                    }).toList(),
                ),
                ],
            ),
            ),
        ),
        );
    }
    ```

    Berikut adalah kode untuk menjelaskan kelas ShopItem secara lebih baik.

    ```
    class ShopItem {
        final String name;
        final IconData icon;

        ShopItem(this.name, this.icon);
        }
    ```

    Kode-kode di atas akan menghasilkan list berupa item-item yang telah dibuat di atas. Akan tetapi, list tersebut belum berbentuk card/button. Kode di bawah ini adalah untuk mengubah tampilannya menjadi card

    ```
    class ShopCard extends StatelessWidget {
        final ShopItem item;

        const ShopCard(this.item, {super.key}); // Constructor

        @override
        Widget build(BuildContext context) {
            return Material(
            color: Colors.grey[100],
                child: Container(
                // Container untuk menyimpan Icon dan Text
                padding: const EdgeInsets.all(8),
                child: Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Icon(
                        item.icon,
                        color: Colors.black,
                        size: 30.0,
                        ),
                        const Padding(padding: EdgeInsets.all(3)),
                        Text(
                        item.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.black),
                        ),
                    ],
                    ),
                ),
                ),
            ),
        }
        }
    ```

3. Memunculkan Snackbar dengan tulisan:

    [x] "Kamu telah menekan tombol Lihat Item", "Kamu telah menekan tombol Tambah Item", "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.

    Snackbar bisa ditimbulkan dengan menambahkan kode `Child: InkWell` agar bisa menambahkan properti `onTap` pada Widget build di ShopCard. Kode ini bertindak seperti OnClick() pada Java, dimana dia akan melakukan sesuatu saat tombol/card diklik.

    ```
    child: InkWell(
    // Area responsive terhadap sentuhan
    onTap: () {
    // Memunculkan SnackBar ketika diklik
    ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
            content: Text("Kamu telah menekan tombol ${item.name}!")));
    },
    )
    ```

4. Menjawab beberapa pertanyaan berikut pada README.md pada root folder.

    [x] Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?

    | Kategori Perbedaan | Stateless | Stateful |
    | :------------: | :------------: | :------------: |
    | Internal State | Tidak ada keadaan internal yang perlu dipertahankan | Dapat memperbarui keadaan internal |
    | Rebuild | Tidak dapat memicu pembangunan kembali | Dapat membangun kembali ketika keadaan berubah |
    | User Interaction | Tidak bereaksi terhadap interaksi pengguna | Merespon interaksi pengguna |
    | Aplikasi | Menampilkan konten statis | Menanggapi masukan pengguna |
    | Performance | Ringan dan efisien | Sedikit lebih banyak overhead |
    | Widget Structure | Kelas tunggal | Kelas ganda: widget & status |
    | State management | Tidak ada state management yang eksplisit | Membutuhkan state management eksplisit menggunakan `setState` |

    [x] Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

    1. MyHomePage (StatelessWidget): Widget utama yang menggambarkan halaman beranda aplikasi. Bertanggung jawab untuk mengatur tampilan utama aplikasi dan merupakan bagian integral dari Scaffold.

    2. Scaffold: Widget ini memberikan kerangka dasar untuk halaman aplikasi. Dalamnya termasuk AppBar, body, dan berbagai atribut lain yang digunakan untuk mengatur tampilan.

    3. AppBar: Bagian dari Scaffold yang memberikan bagian atas (app bar) yang berisi judul aplikasi.

    4. Column: Digunakan untuk menampilkan sejumlah widget children secara vertikal, termasuk teks "Inventory App" dan GridView.

    5. GridView.count: Digunakan untuk menampilkan tata letak grid yang berisi sejumlah item (cards) dan dikonfigurasi untuk menampilkan grid dengan 3 kolom.

    6. ShopCard extends StatelessWidget: Mewakili kartu (card) individual dalam grid. Setiap kartu memiliki ikon dan teks, serta dapat di-tekan untuk menampilkan SnackBar.

    7. Material: Digunakan sebagai wadah untuk setiap kartu dan memberikan latar belakang berwarna sesuai dengan jenis item yang diwakili.

    8. InkWell: Merespons sentuhan, memungkinkan pengguna untuk menekan kartu. Saat ditekan, SnackBar akan muncul.

    9. Container: Berfungsi sebagai wadah untuk mengelola ikon dan teks dalam setiap kartu.

    10. Icon: Digunakan untuk menampilkan ikon yang sesuai dengan item yang direpresentasikan oleh kartu.

    11. Text: Berfungsi untuk menampilkan teks yang sesuai dengan item yang diwakili oleh kartu.

    12. SnackBar: Muncul ketika salah satu kartu ditekan dan memberikan umpan balik kepada pengguna.

</details>

<details>
<summary> Tugas 8 Pemrograman Berbasis Platform </summary>

</br>

# Tugas 8 Pemrograman Berbasis Platform

1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

Dalam Flutter, `Navigator.push()` dan `Navigator.pushReplacement()` adalah dua metode yang digunakan untuk navigasi antar halaman.

a. `Navigator.push()` digunakan untuk menavigasi ke halaman baru tanpa menghapus halaman saat ini dari tumpukan navigasi. Jadi, ketika kita menekan tombol kembali, kita tidak akan keluar dari aplikasi, tetapi kembali ke halaman sebelumnya. Di bawah ini adalah contoh penggunaannya.

```
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => MyHomePage()),
);
```
Dalam contoh di atas, kita menavigasi ke `MyHomePage()` tanpa menghapus halaman saat ini. Jadi, ketika kita menekan tombol kembali, kita akan kembali ke halaman sebelumnya.

b. `Navigator.pushReplacement()` digunakan untuk menghapus route yang sedang ditampilkan kepada pengguna dan menggantinya dengan suatu route. Jadi, ketika kita menekan tombol kembali, kita tidak akan kembali ke halaman sebelumnya, tetapi akan keluar dari aplikasi. Di bawah ini adalah contoh penggunaannya.

```
Navigator.pushReplacement(
    context,
    MaterialPageRoute(
        builder: (context) => MyHomePage(),
));
```
Dalam contoh di atas, kita menavigasi ke `MyHomePage()` dan menghapus halaman saat ini. Jadi, ketika kita menekan tombol kembali, kita tidak akan kembali ke halaman sebelumnya, tetapi akan keluar dari aplikasi.

2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!

Kode widget yang digunakan pada `left_drawer.dart` adalah `Drawer` widget dalam Flutter. `Drawer` ini memiliki dua `ListTile` yang masing-masing mengarah ke halaman yang berbeda ketika diklik. Di bawah ini adalah penjelasan masing-masing layout widgets dan konteks penggunaannya masing-masing.

- `Drawer`: Widget utama yang menciptakan sebuah panel navigasi horizontal (drawer) yang biasanya digunakan dalam `Scaffold.drawer` property.

- `Container`: Widget ini memberikan box painting, positioning, dan sizing untuk child-nya. Dalam kasus ini, digunakan untuk memberikan warna latar belakang pada `Drawer`.

- `ListView`: Widget ini digunakan untuk menampilkan daftar scrollable dari widget. Dalam kasus ini, digunakan untuk menampilkan daftar menu dalam `Drawer`.

- `DrawerHeader`: Widget ini memberikan header untuk `Drawer`. Header ini menampilkan judul aplikasi dan deskripsi singkat.

- `ListTile`: Widget ini biasanya digunakan untuk memberikan item dalam `ListView`. Dalam kasus ini, digunakan untuk memberikan menu dalam `Drawer`. Setiap `ListTile` memiliki ikon dan teks, dan juga aksi yang terjadi ketika menu tersebut diklik (navigasi ke halaman lain).

Secara keseluruhan, kode ini menciptakan sebuah `Drawer` dengan dua menu: "Halaman Utama" dan "Tambah Produk". Ketika menu "Halaman Utama" diklik, aplikasi akan menavigasi ke `MyHomePage`. Ketika menu "Tambah Produk" diklik, aplikasi akan menavigasi ke `ShopFormPage`.
 
3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!

**TextFormField**: elemen input teks biasa. Digunakan untuk memasukkan nama dan harga produk. `TextFormField` memiliki beberapa properti seperti `decoration` untuk mengatur tampilan input, `onChanged` untuk menangani perubahan nilai input, dan `validator` untuk melakukan validasi input.

Berikut adalah penjelasan singkat tentang kode tersebut:

- `ShopFormPage`: Ini adalah `StatefulWidget` yang mengembalikan `Scaffold` yang berisi form untuk menambahkan produk.

- `_formKey`: Ini adalah `GlobalKey` yang digunakan untuk mengidentifikasi `Form` widget dan memvalidasi input form.

- `_name`, `_price`, dan `_description`: Ini adalah variabel yang digunakan untuk menyimpan nilai input form.

- `_saveProduct`: Ini adalah fungsi yang dipanggil ketika form disubmit. Fungsi ini akan menambahkan produk baru ke dalam `productList` jika form valid.

- `Form`: Ini adalah widget yang mengelompokkan beberapa `FormField` bersama-sama dan menyediakan metode validasi.

- `TextFormField`: Ini adalah widget yang menerima input teks dari pengguna. Widget ini memiliki validator untuk memeriksa apakah input valid.

Secara keseluruhan, kode ini menciptakan sebuah form untuk menambahkan produk baru. Ketika form disubmit, produk baru akan ditambahkan ke dalam `productList` dan dialog akan ditampilkan untuk mengonfirmasi bahwa produk telah berhasil disimpan. Jika form tidak valid, pesan error akan ditampilkan di `TextFormField` yang tidak valid.
 
4. Bagaimana penerapan clean architecture pada aplikasi Flutter?

Clean Architecture adalah prinsip desain software yang memberlakukan pemisahan tanggung jawab. Tujuannya adalah untuk menciptakan basis kode yang modular. Cara menerapkan Clean Architecture pada aplikasi Flutter adalah dengan membaginya menjadi empat lapisan arsitektur. Berikut adalah penjelasan masing-masing lapisannya.

a. Lapisan Data: Termasuk logika komunikasi dengan database, API jaringan, dll.

b. Lapisan Domain: Berfungsi sebagai inti aplikasi yang berisi logika bisnis dan model data.

c. Lapisan Fitur: Lapisan presentasi aplikasi, ini adalah lapisan yang paling bergantung pada kerangka kerja, karena berisi UI dan penanganan event dari UI.

d. Lapisan Sumber Daya dan Shared Library: Lapisan pendukung yang berisi kode yang dapat digunakan kembali di seluruh aplikasi.

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)

[x] Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru dengan ketentuan sebagai berikut:

a. Memakai minimal tiga elemen input, yaitu name, amount, description. Tambahkan elemen input sesuai dengan model pada aplikasi tugas Django yang telah kamu buat.

Untuk menambahkan elemen input sesuai model, saya menambahkan kode berikut dengan tujuan mendefinisikan awalan elemen.

```
class _ShopFormPageState extends State<ShopFormPage> {
  /* Elemen ShopFormPageState */
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late int _price;
  late String _description;

```

b. Memiliki sebuah tombol Save.

Tombol save dibuat dengan membuat sebuah ElevatedButton yang bertuliskan `Save`. Cara kerjanya adalah dia memiliki properti OnPressed dimana saat dia menerima input pada form ia akan menyimpannya. Saya membuatnya melalui kode di bawah ini.

```
Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(color: Colors.black)
            ),
            ),  
        ),
        onPressed: _saveProduct,
        child: const Text(
            "Save",
            style: TextStyle(color: Colors.black),
        ),
        ),
    ),
    ),
```

saveProducts adalah sebuah function yang akan menyimpan data dari produk yang diisi pada form. Function tersebut diletakkan di file `shoplist_form.dart` di dalam Class `_ShopFormPageState extends State<ShopFormPage>`.  Berikut adalah kode yang digunakan.

```
void _saveProduct() {
    if (_formKey.currentState!.validate()) {
      productList.add(Product(
        name: _name,
        price: _price,
        description: _description,
      ));
  }

```

c. Setiap elemen input di formulir juga harus divalidasi dengan ketentuan sebagai berikut:

   - Setiap elemen input tidak boleh kosong. --> Hal ini bisa dilakukan dengan cara mencari tahu apakah isi dari form (value-nya) kosong atau tidak.

   - Setiap elemen input harus berisi data dengan tipe data atribut modelnya. --> Hal ini bisa dilakukan dengan melakukan parseType dari input form dan memvalidasi apakah input tersebut sesuai dengan tipe data yang diperlukan.

```
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Produk',
          ),
        ),
        backgroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Produk",
                    labelText: "Nama Produk",
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String value) {
                    setState(() {
                      _name = value;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Nama tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Harga",
                    labelText: "Harga",
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String value) {
                    setState(() {
                      _price = int.tryParse(value) ?? 0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Harga tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Harga harus berupa angka!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Deskripsi",
                    labelText: "Deskripsi",
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String value) {
                    setState(() {
                      _description = value;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Deskripsi tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

```

d. Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.

Untuk bisa membuat sebuah halaman baru yang bertujuan untuk menambah item baru, saya perlu menambahkan sebuah file baru di direktori baru bernama `screens` yang dinamakan `shoplist_form.dart`. Tujuan dari file ini adalah sebagai halaman tujuan dimana saat tombol `Tambah Produk` ditekan dia akan menampilkan kode di file ini.

Di dalamnya, saya menambahkan kode ini sebagai penanda.

```
class ShopFormPage extends StatefulWidget {
  const ShopFormPage({Key? key}) : super(key: key);

  @override
  State<ShopFormPage> createState() => _ShopFormPageState();
}
```

Pada `shop_card.dart`, saya menambahkan kode di bawah ini untuk menghubungkan `shoplist_form` dengan `shop_card.dart`.
    
```
// Navigate ke route yang sesuai (tergantung jenis tombol)
if (item.name == "Tambah Produk") {
Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => const ShopFormPage()
    ));
}
```

e. Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.

Data dimunculkan melalui pop-up dengan cara menambahkan showDialog yang berisi kode sebagai berikut.

```
    showDialog(
    context: context,
    builder: (context) {
        return AlertDialog(
        title: const Text('Produk berhasil tersimpan'),
        content: SingleChildScrollView(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text('Nama: $_name'),
                Text('Harga: $_price'),
                Text('Deskripsi: $_description'),
            ],
            ),
        ),
        actions: [
            TextButton(
            child: const Text('OK'),
            onPressed: () {
                Navigator.pop(context);
            },
            ),
        ],
        );
    },
    );

    _formKey.currentState!.reset();
}
```

[x] Membuat sebuah drawer pada aplikasi dengan ketentuan sebagai berikut:

a. Drawer minimal memiliki dua buah opsi, yaitu Halaman Utama dan Tambah Item.

```
import 'package:flutter/material.dart';
import 'package:inventory_app_mobile/screens/menu.dart';
import 'package:inventory_app_mobile/screens/shoplist_form.dart';
import '../screens/see_products.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.orange[50],
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Text(
                    'Inventory App Mobile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Text("Catat seluruh keperluan belanjamu di sini!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Halaman Utama'),
              // Bagian redirection ke MyHomePage
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_shopping_cart),
              title: const Text('Tambah Produk'),
              // Bagian redirection ke ShopFormPage
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ShopFormPage(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.checklist),
              title: const Text('Lihat Produk'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProductListPage(products: productList)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
```

Pada kode di atas, Drawer berisikan tiga Tiles yang istilahnya merupakan 'buttons' untuk berpindah ke halaman Tambah Produk, Lihat Produk, dan Halaman Utama. Disini saya menggunakan Navigator.pushReplacement agar aplikasi tidak tertutup saat saya menekan tombol back, sehingga aplikasi bisa berjalan terus menerus.

b. Ketika memiih opsi Halaman Utama, maka aplikasi akan mengarahkan pengguna ke halaman utama.

Sudah diimplementasikan di atas dengan cara menambahkan baris kode `MaterialPageRoute(builder: (context) => const MyHomePage(),` yang mana akan mengubah tampilan website dari leftDrawer menjadi halaman MyHomePage.

c. Ketika memiih opsi (Tambah Item), maka aplikasi akan mengarahkan pengguna ke halaman form tambah item baru.

Sudah diimplementasikan di atas dengan cara menambahkan baris kode `MaterialPageRoute(builder: (context) => const ShopFormPage(),` yang mana akan mengubah tampilan website dari leftDrawer menjadi halaman ShopFormPage.


</details>