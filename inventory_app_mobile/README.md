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