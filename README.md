# TUGAS 7 PBP

1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.
Stateless widget adalah komponen widget yang bersifat statis sehingga tampilannya tidak berubah pada kondisi apapun. Sementara itu, stateful widget adalah komponen widget yang tampilannya bisa berubah-ubah tergantung kondisi tertentu. Pada implementasi stateful widget, nilai dari suatu variabel yang dinisiasi dapat mengubah state dari suatu stateful widget. Perbedaan antara stateless widget dibandingkan dengan stateful widget adalah pada stateful widget akan dilakukan fungsi setState() yang akan mengubah tampilan app dari kondisi sebelum terjadi perubahan state menjadi tampilan ketika state sudah berubah dengan melakukan rebuild.

2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
Widget yang digunakan pada bagian paling luar adalah Scaffold yang merentang seluruh layar app. Di dalam Scaffold ada beberapa bagian, yaitu bagian app bar yang menggunakan widget AppBar sebagai komponen box berisi judul aplikasi, bagian body yang menggunakan widget Center untuk memposisikan elemen di dalamnya ke tengah, dan bagian terakhir adalah floating button yang mengimplementasikan widget FloatingActionButton di dalam widget Align untuk memposisikan button di pojok kiri bawah dan kanan bawah. Khusus untuk button decrement di sebelah kiri, komponennya di wrap dalam widget Visibility agar button bisa disembunyikan ketika counter bernilai 0. Bagian floating button di wrap dalam widget Stack untuk menumpuk dua komponen floating button di layar yang sama, lalu di wrap lagi di dalam widget Padding untuk memberikan jarak pada button dengan sisi-sisi layar.

3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
Fungsi setState() digunakan untuk memperbarui state dengan mengubah nilai variabel kemudian mengubah tampilan app yang sebelumnya menjadi tampilan yang sudah berubah akibat terjadinya perubahan state. Variabel yang berubah adalah counter untuk mengubah nilai counter, numState untuk mengubah teks angka genap dan ganjil, stateColor untuk mengatur warna font teks ketika genap dan ganjil, dan showButton sebagai toggle untuk menampilkan dan menyembunyikan button decrement di pojok kiri bawah.

4. Jelaskan perbedaan antara const dengan final.
Variabel dengan keyword const akan melakukan assign value saat compile time dan digunakan pada expression yang juga dievaluasi saat compile time. Sementara itu, keyword final akan melakukan assign value saat runtime sehingga dimungkinkan variabel tersebut baru diketahui nilainya saat runtime. Oleh karena itu, variabel dengan keyword const lebih strict dibandingkan dengan final dan keyword const akan mengubah suatu value menjadi bersifat deeply immutable.

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
-  Membuat sebuah program Flutter baru dengan nama counter_7.
Menjalankan command "flutter create counter_7" untuk membuat aplikasi baru.

-  Tombol + menambahkan angka sebanyak satu satuan.
Menambahkan widget FloatingActionButton yang dipasangkan dengan fungsi untuk menambah nilai counter yaitu fungsi incrementCounter(). Di dalam fungsi tersebut, dipanggil fungsi setState() untuk mengubah value counter dan merefresh tampilan app.

-  Tombol - mengurangi angka sebanyak satu satuan. Apabila counter bernilai 0, maka tombol - tidak memiliki efek apapun pada counter.
Menambahkan widget FloatingActionButton lain yang dipasangkan dengan fungsi untuk mengurangi nilai counter nilai counter yaitu fungsi decrementCounter(). Di dalam fungsi tersebut, dipanggil fungsi setState() untuk mengubah value counter dan merefresh tampilan app. Decrement counter hanya dilakukan jika kondisi value counter tidak nol.

-  Apabila counter bernilai ganjil, maka teks indikator berubah menjadi "GANJIL" dengan warna biru.
Pada setiap fungsi setState(), akan dijalankan pula fungsi updateNumState() yang didalamnya terdapat selection. Jika nilai counter ganjil (bersisa ketika dibagi 2), maka variabel numState berubah menjadi string "GANJIL" dan stateColor berubah menjadi widget TextStyle dengan atribut color blue.

-  Apabila counter bernilai genap, maka teks indikator berubah menjadi "GENAP" dengan warna merah.
Pada setiap fungsi setState(), akan dijalankan pula fungsi updateNumState() yang didalamnya terdapat selection. Jika nilai counter genap (tidak bersisa ketika dibagi 2), maka variabel numState berubah menjadi string "GENAP" dan stateColor berubah menjadi widget TextStyle dengan atribut color red.

-  Menyembunyikan/menghilangkan tombol - apabila counter bernilai 0. (Bonus)
Menyimpan tombol decrement di dalam widget Visibility, lalu atribut visible-nya adalah variabel showButton yang bertipe boolean. Variabel showButton ini akan berubah menjadi true ketika value counter tidak nol dan menjadi false ketika nol. Default value showButton ketika awal menjalankan app adalah false sehingga button decrement tidak terlihat. Ketika di-increment, barulah tombol decrement akan muncul. Namun, tombol tersebut akan kembali menghilang saat value counter 0.

# TUGAS 8 PBP

1. Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement.
    Navigator.push() menumpuk tampilan layar yang sebelumnya dengan tampilan layar yang baru, sedangkan Navigator.pushReplacement() mengganti atau replace keseluruhan tampilan layar yang sebelumnya dengan tampilan layar yang baru. Jika menggunakan Navigator.push(), maka kita bisa kembali ke tampilan layar sebelumnya dengan melakukan perintah Navigator.pop().

2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
    Widget yang baru digunakan pada tugas kali ini adalah SingleChildScrollView (untuk mengaktifkan fitur page scrolling pada satu child widget), Drawer (untuk membuat list pilihan menu halaman yang akan ditampilkan dengan bentuk seperti hamburger), Form (untuk membuat formulir pengisian data oleh pengguna yang akan divalidasi dengan unique key), TextFormField (untuk menerima input data formulir berupa teks), Icon (untuk menampilkan ikon-ikon default yang ada di library flutter), ListTile (untuk menaruh elemen-elemen widget di dalam list dalam bentuk seperti ubin), DropdownButton (widget tombol untuk menampilkan menu dropdown list), DropdownMenuItem (untuk menampilkan pilihan yang ada pada komponen dropdown), Expanded (untuk menampilkan widget yang merentang seluruh komponen Row, Column, atau Flex), dan SizedBox (untuk membuat persegi dengan ukuran yang tidak berubah, biasa dipakai untuk memberikan spasi atau jeda antar widget).

3. Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).
    Beberapa jenis event yang ada di Flutter adalah onPressed (event ketika widget button diklik), onSaved (event ketika input data form berhasil disimpan), onChanged (event ketika value yang ada di dalam text field diubah), onFieldSubmit (event saat field data formulir disubmit), onTap (event saat widget tile diklik), onLongPress (event ketika tombol ditekan lama), onHover (event ketika kursor berada di atas widget button).

4. Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.
    Navigator mengarahkan pengguna menuju halaman tertentu pada aplikasi. Sistem Navigator dibangun oleh struktur data stack sebab menggunakan prinsip bahwa tampilan layar yang berubah-ubah dapat direpresentasikan sebagai layar yang ditumpuk satu sama lain. Navigator membutuhkan route sebagai alamat halaman tujuan yang akan ditampilkan. Jadi, penggantian tampilan layar menggunakan sistem push dan pop yang mirip dengan struktur data stack. Push artinya adalah menaruh tampilan baru pada posisi paling atas sehingga menjadi layar yang saat itu akan ditampilkan. Sementara itu, pop artinya adalah membuang layar yang ada di posisi paling atas sehingga aplikasi akan menampilkan layar yang tepat berada di bawah layar yang di pop.

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
-  Menambahkan drawer/hamburger menu pada app yang telah dibuat sebeumnya.
    Menambahkan atribut drawer pada widget Scaffold di tiap halaman dan mengisinya dengan value berupa custom widget Drawer yang sudah dibuat pada file terpisah (refactor). 

-  Menambahkan tiga tombol navigasi pada drawer/hamburger.
    Memasukkan tiga widget ListTile di dalam widget Drawer. Masing-masing widget ListTile akan mengarahkan pengguna ke halaman tertentu yang ada di aplikasi. Navigator akan menampilkan halaman yang dituju ketika terjadi event onTap pada ListTile.

-  Menambahkan halaman form, lalu: menambahkan elemen input dengan tipe data String berupa judul budget, menambahkan elemen input dengan tipe data int berupa nominal budget, menambahkan elemen dropdown yang berisi tipe budget dengan pilihan pemasukan dan pengeluaran, dan menambahkan button untuk menyimpan budget.
    Membuat file baru pada folder lib dengan nama form.dart. Lalu, mendefinisikan class page tersebut dan membuat statenya. Berikutnya adalah menginisiasi variabel-variabel yang dibutuhkan yaitu judul, nominal, jenis, dan tanggal sesuai dengan tipenya masing-masing. Memasukkan widget TextFormField untuk menerima input data berupa teks. Kemudian, menambahkan komponen DropdownButton dalam bentuk ListTile dengan atribut items berupa list pilihan jenis yang di map menjadi value dari widget DropdownMenuItem yang dikembalikan. Menambahkan button untuk memilih tanggal dalam bentuk ListTile. Terakhir, menambahkan widget TextButton di bagian paling bawah yang ketika terjadi event onPressed akan menambahkan data-data input ke list yang berisi kumpulan list data budget.

-  Menambahkan halaman data budget kemudian menampilkan semua judul, nominal, dan tipe budget yang telah ditambahkan pada form
    Membuat file baru pada folder lib dengan nama data.dart. Kemudian, melakukan retrieve terhadap data list of list yang berisi input pengguna dengan menambahkannya sebagai parameter wajib dalam constructor DataPage. Langkah berikutnya, adalah menginisiasi list kosong untuk widget yang akan ditampilkan karena nantinya widget akan ditambahkan ke dalam list satu per satu pada setiap iterasi pada list data input pengguna. Jadi, pada method build di halaman ini, pada awalnya hanya ada widget SingleChildScrollView yang isinya Container dengan paddding dan di dalamnya lagi ada widget Column yang masih kosong. Children dari Column kosong ini akan diisi dengan list widget yang diappend dengan widget-widget untuk menampilkan input data tiap iterasi. Tiap box data yang ditampilkan diaplikasikan dengan widget Container yang memiliki border berwarna biru. Teks data ditampilkan dengan menggunakan kumpulan widget Row.

# TUGAS 9 PBP

1.  Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
    Ya, bisa. Teknik pengambilan data JSON dapat dilakukan dengan dua cara, yaitu serialisasi JSON secara inline dan serialisasi JSON di dalam kelas model. Jika tidak membuat model terlebih dahulu, maka data fetch tetap bisa dilakukan dengan metode serialisasi JSON inline. Namun, melakukan serialisasi JSON dengan metode inline lebih rentan terhadap error sebab kesalahan dalam mengetik field dari Object dapat menyebabkan error saat runtime. Solusi yang lebih baik adalah menggunakan serialisasi JSON di dalam kelas model karena dapat mencegah terjadinya runtime error dengan melempar exception saat proses compile sehingga debugging lebih mudah dilakukan. Hal ini disebabkan Object disimpan dalam struktur kelas model dan tidak disimpan dalam struktur map seperti metode inline.

2.  Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
-   Card = Kotak kartu yang berisi informasi
-   RoundedRectangleBorder = Border atau outline dengan bentuk persegi yang membulat di ujung-ujungnya
-   Checkbox = Kotak yang bisa diklik untuk mengubah suatu state boolean, ketika ada tanda centang artinya statenya adalah true
-   FutureBuilder = Builder widget yang berbasis pada data snapshot terakhir yang diambil dari atribut future
-   Table = Struktur penyimpanan komponen widget dalam bentuk tabel
-   TableRow = Widget yang merepresentasikan baris dari struktur tabel
-   TableCell = Widget yang merepresentasikan sel dari struktur tabel
-   ElevatedButton = Tombol dengan elevasi sehingga akan terlihat lebih berdimensi

3.  Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.
    URL dari data JSON pada aplikasi Heroku diambil dengan method HTTP get, lalu disimpan sebagai response. Response tersebut akan di-decode menjadi JSON dengan fungsi jsonDecode(). Selanjutnya, data JSON dikonversi menjadi objek-objek MyWatchlist yang kemudian disimpan dalam struktur data List. Objek MyWatchlist akan ditampilkan satu per satu dengan method builder() pada widget ListView sehingga tiap objek MyWatchlist akan ditampilkan dalam widget Card masing-masing.

4.  Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
-   Menambahkan tombol navigasi pada drawer/hamburger untuk ke halaman mywatchlist.
    Menambahkan widget ListTile di akhir build dari file drawer yang sudah di refactor di tugas sebelumnya. Ketika event onTap pada ListTile, maka akan dilakukan pushReplacementNamed() dengan routing bernama '/watchlist'.

-   Membuat satu file dart yang berisi model mywatchlist.
    Membuat folder models baru yang diisi dengan file mywatchlist.dart untuk menyimpan kelas model dari objek MyWatchlist. Initial data JSON dari Tugas 3 dimasukkan ke website Quicktype (https://app.quicktype.io/) untuk mengkonversi JSON menjadi models dalam bahasa Dart. Kode models hasil konversi di salin ke mywatchlist.dart.

-   Menambahkan halaman mywatchlist yang berisi semua watch list yang ada pada endpoint JSON di Django yang telah kamu deploy ke Heroku sebelumnya (Tugas 3). Pada bagian ini, kamu cukup menampilkan judul dari setiap mywatchlist yang ada.
    Membuat file baru bernama watchlist_page.dart di dalam folder lib. Lalu, membuat kelas MyWatchlistPage dan kelas statenya. Di dalam kelas statenya, terdapat widget build yang akan membuat list judul objek MyWatchlist yang akan ditampilkan pada widget Card. Judul objek diakses dengan objectMyWatchlist.fields.title. Card memiliki child berupa ListTile yang bisa diklik dengan atribut title nya diisi dengan judul objek MyWatchlist tadi. Selain itu, ditambahkan pula overriding fungsi initState() untuk memperbarui data watchlistData dengan melakukan fetch kembali dari endpoint JSON.

-   Membuat navigasi dari setiap judul watch list ke halaman detail
    Saat terjadi event onTap pada ListTile, akan terjadi push halaman detail dengan menggunakan Navigator.push() yang memiliki MaterialPageRoute, yaitu halaman detail yang akan dituju.

-   Menambahkan halaman detail untuk setiap mywatchlist yang ada pada daftar tersebut. Halaman ini menampilkan judul, release date, rating, review, dan status (sudah ditonton/belum).
    Membuat file baru di dalam folder lib bernama watchlist_detail.dart yang berisi kelas MyWatchlistDetail yang meng-extend StatelessWidget. Pada override widget build, atribut appbar diisi dengan text "Detail", drawer diisi dengan DrawerWidget yang merupakan custom drawer yang ada di widget_drawer.dart, body diisi dengan widget SingleChildScrollView agar halaman dapat discroll yang mengandung widget Column yang akan menyimpan children widget-widget untuk menampilkan data detail dari objek MyWatchlist.

-   Menambahkan tombol untuk kembali ke daftar mywatchlist
    Menambahkan atribut bottomSheet pada Scaffold di build kelas MyWatchlistDetail. Tombol ElevatedButton ditambahkan ke atribut bottomSheet tersebut sehingga tombol kembali akan selalu ditempatkan pada bagian bawah layar halaman. Button diberi padding dengan di-wrap dalam widget Padding. Ukuran tombol diatur dengan minimumsize berupa Size.fromHeight() agar lebar tombol mengikuti lebar layarnya. Ketika event onPressed, akan terjadi Navigator.pop() sehingga layer halaman yang ada di paling atas stack, yaitu halaman detail akan dibuang. Hasilnya adalah kembali ke halaman mywatchlist sebab pada Stack, halaman yang posisinya berada tepat di bawah halaman detail adalah halaman mywatchlist. Terakhir button diberi child berupa widget Text yang bertuliskan 'Back'.