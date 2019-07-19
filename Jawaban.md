EXPLAIN THIS QUESTION
1. Memory leak adalah kondisi kegagalan mengakses memory yang sudah tidak lagi digunakan
2. App thinning adalah optimasi yang bertujuan untuk mengurangi kapasitas aplikasi sehingga lebih cepat didownload dan tidak menggunakan terlalu banyak kapasitas memory hp
3. Untuk bahasa pemrogramannya lebih mudah dipahami dan tidak perlu lagi pointer ataupun ; untuk menutup 1 baris line code.
4. GCD itu adalah metode penjadwalan untuk mengeksekusi suatu pekerjaan yang datang secara terpisah ataupun bersamaan dama satu waktu, harapanya adalah agar menjaga ketahanan kita saat ada antrian pekerjaan yg harus diselesaikn

APLICATION BUILDING
1. Menggunakan VIPER untuk 
pros:
- dengan membagi menjadi 5 module yang memiliki fungsi sendiri-sendiri, memudahkan untuk ditracing.
- structure yang lebih rapi
- code clean
- Mudah untuk dilakukan unit testing
Cons:
- tidak cocok untuk project yang sederhana karena akan memakan waktu dalam pengerjaannya
- penggunaannya akan terkadang tidak bisa meng over semua structured yang harus dibagi menjadi 5 bagian, seperti terkadang tidak ada view ataupun intercator.
- masih belum bisa menghandle Uitabviewcontroller dengan menggunakan structure viper karena action pada tab tdk dapat diatur dalam routing di vipernya


