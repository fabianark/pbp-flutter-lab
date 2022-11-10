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