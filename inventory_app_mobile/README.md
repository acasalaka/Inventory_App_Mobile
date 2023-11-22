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

<details>
<summary> Tugas 9 Pemrograman Berbasis Platform </summary>

</br>

# Tugas 9 Pemrograman Berbasis Platform

- [x] Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik.

    Pastikan Secret and Variables pada Repository GitHub sudah benar dan tepat lalu pastikan file-file yang dibutuhkan untuk keperluan deployment sudah ada pada file proyek Django.

- [x] Membuat halaman login pada proyek tugas Flutter. 

    Buat file 'login.dart' pada projek Flutter lalu isi dengan kode:
    ```
    import 'package:inventory_app_mobile/screens/menu.dart';
    import 'package:flutter/material.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';
    
    void main() {
      runApp(const LoginApp());
    }
    
    class LoginApp extends StatelessWidget {
      const LoginApp({super.key});
    
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          title: 'Login',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const LoginPage(),
        );
      }
    }
    
    class LoginPage extends StatefulWidget {
      const LoginPage({super.key});
    
      @override
      _LoginPageState createState() => _LoginPageState();
    }
    
    class _LoginPageState extends State<LoginPage> {
      final TextEditingController _usernameController = TextEditingController();
      final TextEditingController _passwordController = TextEditingController();
    
      @override
      Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
          appBar: AppBar(
            title: const Text('Login'),
          ),
          body: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                  ),
                ),
                const SizedBox(height: 12.0),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () async {
                    String username = _usernameController.text;
                    String password = _passwordController.text;
    
                    // Cek kredensial
                    final response = await request.login("http://127.0.0.1:8000/auth/login/", {
                      'username': username,
                      'password': password,
                    });
    
                    if (request.loggedIn) {
                      String message = response['message'];
                      String uname = response['username'];
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                            SnackBar(content: Text("$message Selamat datang, $uname.")));
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Login Gagal'),
                          content:
                          Text(response['message']),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        );
      }
    }
    ```

- [x] Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.

    Pada projek Django buat app baru bernama `authentication` lalu install library 'django-cors-headers'. Tambahkan `authentication dan `corsheaders` kedalam `INSTALLED_APPS` di `settings.py`. Tambahkan juga `corsheaders.middleware.CorsMiddleware` pada `settings.py` dan tambahkan beberapa variabel berikut ini:
    ```
    CORS_ALLOW_ALL_ORIGINS = True
    CORS_ALLOW_CREDENTIALS = True
    CSRF_COOKIE_SECURE = True
    SESSION_COOKIE_SECURE = True
    CSRF_COOKIE_SAMESITE = 'None'
    SESSION_COOKIE_SAMESITE = 'None'
    ```
    Buat fungsi `login`, `logout` pada `authentication/views.py` dan lakukan routingnya pada `urls.py`

    Install package berikut ini pada projek Flutter:
    ```
    flutter pub add provider
    flutter pub add pbp_django_auth
    ```
    Lalu ubah class `MyApp` pada `main.dart` menjadi:
    ```
    class MyApp extends StatelessWidget {
      const MyApp({Key? key}) : super(key: key);
    
      @override
      Widget build(BuildContext context) {
        return Provider(
          create: (_) {
            CookieRequest request = CookieRequest();
            return request;
          },
          child: MaterialApp(
              title: 'Flutter App',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
                useMaterial3: true,
              ),
              home: LoginPage()),
        );
      }
  }
  ```

- [x] Membuat model kustom sesuai dengan proyek aplikasi Django. 

    Buka endpoint `JSON` pada website Django lalu copy semua data yang ada di endpoint `JSON`. Buka situs web Quicktype dan tempel data `JSON` tadi lalu ubah language menjadi `DART`. Lalu tekan tombol `Copy Code` pada Quicktype.
    
    Pada projek Flutter buat folder baru `lib/models` lalu buat file baru `product.dart` dan tempel kode yang sudah disalin dari Quicktype sehingga menjadi seperti ini:
    ```
    // To parse this JSON data, do
    //
    //     final product = productFromJson(jsonString);
    
    import 'dart:convert';
    
    List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));
    
    String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
    
    class Product {
      String model;
      int pk;
      Fields fields;
    
      Product({
        required this.model,
        required this.pk,
        required this.fields,
      });
    
      factory Product.fromJson(Map<String, dynamic> json) => Product(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );
    
      Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
    }
    
    class Fields {
      int user;
      String name;
      int amount;
      String description;
    
      Fields({
        required this.user,
        required this.name,
        required this.amount,
        required this.description,
      });
    
      factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        amount: json["amount"],
        description: json["description"],
      );
    
      Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "amount": amount,
        "description": description,
      };
    }
    ```

- [x] Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy. 
        
    Pada projek Flutter buat file `see_products.dart` lalu isi dengan kode:
    ```
    import 'package:flutter/material.dart';
    import 'package:http/http.dart' as http;
    import 'dart:convert';
    import 'package:inventory_app_mobile/models/product.dart';
    import 'package:inventory_app_mobile/screens/detail_product.dart';
    import 'package:inventory_app_mobile/widgets/left_drawer.dart';
    
    class ProductPage extends StatefulWidget {
      const ProductPage({Key? key}) : super(key: key);
    
      @override
      _ProductPageState createState() => _ProductPageState();
    }
    
    class _ProductPageState extends State<ProductPage> {
      Future<List<Product>> fetchProduct() async {
        // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
        var url = Uri.parse(
            'http://127.0.0.1:8000/json/');
        var response = await http.get(
          url,
          headers: {"Content-Type": "application/json"},
        );
    
        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));
    
        // melakukan konversi data json menjadi object Product
        List<Product> see_products = [];
        for (var d in data) {
          if (d != null) {
            see_products.add(Product.fromJson(d));
          }
        }
        return see_products;
      }
    }
    ```
    
  - [x] Tampilkan name, amount, dan description dari masing-masing item pada halaman ini.

        Pada file `see_products.dart` tambahkan kode:
        ```
        ...
        @override
          Widget build(BuildContext context) {
            return Scaffold(
                appBar: AppBar(
                  title: const Text('Product'),
                ),
                drawer: const LeftDrawer(),
                body: FutureBuilder(
                    future: fetchProduct(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        if (!snapshot.hasData) {
                          return const Column(
                            children: [
                              Text(
                                "Tidak ada data produk.",
                                style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                              ),
                              SizedBox(height: 8),
                            ],
                          );
                        } else {
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (_, index) => Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${snapshot.data![index].fields.name}",
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text("${snapshot.data![index].fields.amount}"),
                                    const SizedBox(height: 10),
                                    Text(
                                        "${snapshot.data![index].fields.description}"),
                                  ],
                                ),
                              ));
                        }
                      }
                    }));
          }
        ...
        ```

- [x] Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item. 

    Pada projek Flutter buat file baru `detail_product.dart` lalu isi dengan kode:
    ```
    import 'dart:ui';
    import 'package:flutter/material.dart';
    import 'package:http/http.dart' as http;
    import 'dart:convert';
    import 'package:inventory_app_mobile/models/product.dart';
    import 'package:inventory_app_mobile/widgets/left_drawer.dart';
    import 'package:inventory_app_mobile/screens/see_products.dart';
    
    
    
    class DetailProductPage extends StatelessWidget {
      const DetailProductPage({Key? key, required this.id}) : super(key: key);
      final int id;
    
      Future<List<Product>> fetchProduct() async {
        // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
        var url = Uri.parse(
            'http://127.0.0.1:8000/json/${id}');
        var response = await http.get(
          url,
          headers: {"Content-Type": "application/json"},
        );
    
        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));
    
        // melakukan konversi data json menjadi object Product
        List<Product> see_products = [];
        for (var d in data) {
          if (d != null) {
            see_products.add(Product.fromJson(d));
          }
        }
        return see_products;
      }
    }
    ```

    - [x] Halaman ini dapat diakses dengan menekan salah satu item pada halaman daftar Item.
  
        Pada file `see_products.dart` tambahkan kode berikut ini di bagian `return ListView.builder(...)`:
        ```
        ...
         ElevatedButton(
            onPressed: () async {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => DetailProductPage(id: snapshot.data![index].pk)),
              );
            },
            child: const Text('Detail Product'),
          ),
        ...
        ```

      - [x] Tampilkan seluruh atribut pada model item kamu pada halaman ini. 
  
          Pada file `detail_product.dart` tambahkan kode berikut ini:
          ```
          ...
          @override
            Widget build(BuildContext context) {
              return Scaffold(
                  appBar: AppBar(
                    title: const Text('Detail Product'),
                  ),
                  drawer: const LeftDrawer(),
                  body: FutureBuilder(
                      future: fetchProduct(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                          return const Center(child: CircularProgressIndicator());
                        } else {
                          if (!snapshot.hasData) {
                            return const Column(
                              children: [
                                Text(
                                  "Tidak ada data produk.",
                                  style:
                                  TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                                ),
                                SizedBox(height: 8),
                              ],
                            );
                          } else {
                            return ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (_, index) => Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${snapshot.data![index].fields.name}",
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text("Amount: ${snapshot.data![index].fields.amount}"),
                                      const SizedBox(height: 10),
                                      Text("Price: ${snapshot.data![index].fields.price}"),
                                      const SizedBox(height: 10),
                                      Text(
                                          "${snapshot.data![index].fields.description}"),
                                    ],
                                  ),
                                ));
                          }
                        }
                      }));
            }
          ...
          ```

      - [x] Tambahkan tombol untuk kembali ke halaman daftar item. 

          Pada file `see_products.dart` tambahkan kode berikut ini di bagian `return Scaffold(...)`:
          ```
          ...
          ElevatedButton(
              onPressed: () async {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ProductPage()),
                );
              },
              child: const Text('Kembali'),
            ),
          ...
          ```

- [x] Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON? 
    
    Ya, Dapat melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Secara umum, ini dikenal sebagai deserialization atau parsing JSON. Dalam Flutter, dapat dilakukan dengan menggunakan library seperti dart:convert.

    Namun, membuat model (biasanya dalam bentuk Dart class) dapat memberikan beberapa keuntungan, terutama jika struktur JSON kompleks dan perlu mengelola data dengan lebih terstruktur. Beberapa keuntungan membuat model meliputi:

  1. Type Safety: Dengan membuat model, dapat menggunakan sistem tipe Dart untuk memastikan bahwa tipe data yang diharapkan sesuai dengan yang sebenarnya.
  2. Readibility Code yang Lebih Baik:  Membuat model dapat membuat kode lebih mudah dibaca dan dimengerti, terutama jika ada banyak properti.
  3. Refaktorisasi Kode yang Lebih Mudah:  Jika struktur data berubah, refaktorisasi kode dapat lebih mudah dengan menggunakan model, karena perubahan hanya perlu dilakukan di satu tempat.

    Jadi jika ingin cepat dalam membuat program lebih baik tidak usah membuat model tetapi jika kode ingin lebih rapih, mudah dikembangkan, dan aman untuk kedepannya lebih baik membuat model.

- [x] Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter. 

    CookieRequest adalah kelas yang digunakan untuk mengirim permintaan HTTP dengan cookie. Ketika permintaan HTTP dikirim, cookie dapat disertakan dalam permintaan tersebut. Ini memungkinkan server untuk mengidentifikasi pengguna yang terautentikasi dan menyimpan informasi tentang sesi pengguna. 

    Instance CookieRequest perlu dibagikan ke semua komponen di aplikasi Flutter karena ini memungkinkan setiap komponen untuk mengakses cookie yang sama. Dengan cara ini, setiap komponen dapat mengakses informasi yang sama tentang pengguna yang terautentikasi dan sesi pengguna. Ini sangat penting dalam aplikasi yang memerlukan otentikasi pengguna.

- [x] Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter. 

  Untuk mengambil data dari JSON dan menampilkannya di Flutter, Anda dapat mengikuti langkah-langkah berikut:

1. **Tambahkan paket http**: Paket http menyediakan cara termudah untuk mengambil data dari internet. Untuk menambahkan paket http sebagai dependensi, kita harus menjalankan perintah berikut di terminal `flutter pub add http`.

Setelah itu, kita harus mengimpor paket http di file Dart kita, `import 'package:http/http.dart' as http;`

2. **Buat permintaan jaringan**: Pada file `android/app/src/main/AndroidManifest.xml`, tambahkan kode berikut untuk memperbolehkan akses Internet pada aplikasi Flutter yang sedang dibuat.

<application>
...
</application>
<uses-permission android:name="android.permission.INTERNET" />


3. **Membuat Model Dart**: kita harus membuat model Dart baru untuk mencerminkan struktur data JSON yang kita buat.

4. **Deserialisasi Objek Dart**: Untuk memudahkan, kita mengubahnya dengan menggunakan quickType.com dan mengimport `dart:convert ` di file Dart.

5. **Menampilkan Data pada Flutter UI**: Menampilkan data tersebut pada antarmuka pengguna Flutter. Ini melibatkan pembuatan widget yang menggunakan nilai dari objek Dart tersebut.

- [x] Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter. 

1. **Buat Form Login pada Flutter**: Pertama, Anda perlu membuat form login pada aplikasi Flutter Anda. Form ini biasanya akan meminta pengguna untuk memasukkan username dan password¹.

2. **Kirim Data ke Server Django**: Setelah pengguna mengisi form dan menekan tombol submit, aplikasi Flutter Anda harus mengirimkan data tersebut ke server Django. Ini biasanya dilakukan dengan membuat permintaan POST ke endpoint tertentu pada server Django¹.

3. **Proses Data di Server Django**: Setelah menerima data dari aplikasi Flutter, server Django akan memproses data tersebut. Ini biasanya melibatkan pengecekan apakah username dan password yang diberikan cocok dengan data yang ada di database¹.

4. **Kirim Respons ke Aplikasi Flutter**: Jika data yang diberikan cocok, server Django akan mengirimkan respons sukses ke aplikasi Flutter. Respons ini biasanya berisi token autentikasi yang dapat digunakan untuk mengautentikasi permintaan selanjutnya dari aplikasi Flutter¹.

5. **Tampilkan Menu pada Flutter**: Setelah menerima respons sukses dari server Django, aplikasi Flutter dapat menampilkan menu utama¹.

- [x] Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.

  1. Scaffold: Kerangka dasar aplikasi Flutter. 
  2. AppBar: Baris judul di bagian atas layar. 
  3. LeftDrawer: Widget kustom yang kemungkinan berisi navigasi atau tautan. 
  4. FutureBuilder: Menggunakan hasil dari Future (fetchProduct()) untuk membangun antarmuka pengguna berdasarkan status Future. 
  5. Column: Wadah vertikal untuk tata letak. 
  6. ListView.builder: Membuat daftar elemen dengan jumlah dinamis. 
  7. Container: Wadah elemen-elemen UI dengan margin dan padding. 
  8. Text: Menampilkan teks pada antarmuka pengguna. 
  9. SizedBox: Memberikan spasi vertikal. 
  10. ElevatedButton: Tombol dengan latar belakang yang diangkat, digunakan untuk kembali ke halaman produk.

</details>