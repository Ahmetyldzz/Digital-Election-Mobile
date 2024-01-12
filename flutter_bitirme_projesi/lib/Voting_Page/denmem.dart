import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(AjandaApp());
}

class AjandaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ajanda Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AjandaPage(),
    );
  }
}

class AjandaPage extends StatefulWidget {
  @override
  _AjandaPageState createState() => _AjandaPageState();
}

class Etkinlik {
  final String? baslik;
  final String? aciklama;
  final DateTime? tarih;
  final TimeOfDay? saat;

  Etkinlik(this.baslik, this.aciklama, this.tarih, this.saat);
}

class _AjandaPageState extends State<AjandaPage> {
  // Ajanda için kullanılacak veri modeli

  // Ajandaya eklenecek etkinliklerin listesi
  List<Etkinlik> etkinlikler = [];

  // Etkinlik ekleme sayfasına yönlendiren fonksiyon
  void etkinlikEkle() async {
    // Etkinlik ekleme sayfasından dönen değeri bekleyen fonksiyon
    final etkinlik = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EtkinlikEklemePage()),
    );

    // Eğer etkinlik ekleme sayfasından bir etkinlik döndüyse
    if (etkinlik != null) {
      // Etkinlik listesine ekleyen ve sayfayı güncelleyen fonksiyon
      setState(() {
        etkinlikler.add(etkinlik);
      });
    }
  }

  // Ajanda sayfasının arayüzünü oluşturan fonksiyon
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajanda Uygulaması'),
      ),
      body: ListView.builder(
        itemCount: etkinlikler.length,
        itemBuilder: (context, index) {
          // Listeden bir etkinlik seçen fonksiyon
          final etkinlik = etkinlikler[index];

          // Etkinliğin tarih ve saat bilgilerini formatlayan fonksiyonlar
          final tarih = DateFormat.yMd('tr_TR').format(etkinlik.tarih!);
          final saat = etkinlik.saat!.format(context);

          // Etkinliği gösteren kart widget'ını döndüren fonksiyon
          return Card(
            child: ListTile(
              title: Text(etkinlik.baslik!),
              subtitle: Text('${etkinlik.aciklama}\n$tarih $saat'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: etkinlikEkle,
      ),
    );
  }
}

class EtkinlikEklemePage extends StatefulWidget {
  @override
  _EtkinlikEklemePageState createState() => _EtkinlikEklemePageState();
}

class _EtkinlikEklemePageState extends State<EtkinlikEklemePage> {
  // Etkinlik ekleme sayfası için kullanılacak form anahtarı
  final formKey = GlobalKey<FormState>();

  // Etkinlik ekleme sayfası için kullanılacak alanlar
  String? baslik;
  String? aciklama;
  DateTime? tarih;
  TimeOfDay? saat;

  // Etkinlik ekleme sayfası için kullanılacak tarih seçici fonksiyonu
  void tarihSec() async {
    // Tarih seçici widget'ından dönen değeri bekleyen fonksiyon
    final secilenTarih = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    // Eğer tarih seçici widget'ından bir tarih döndüyse
    if (secilenTarih != null) {
      // Tarih alanını güncelleyen ve sayfayı yenileyen fonksiyon
      setState(() {
        tarih = secilenTarih;
      });
    }
  }

  // Etkinlik ekleme sayfası için kullanılacak saat seçici fonksiyonu
  void saatSec() async {
    // Saat seçici widget'ından dönen değeri bekleyen fonksiyon
    final secilenSaat = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    // Eğer saat seçici widget'ından bir saat döndüyse
    if (secilenSaat != null) {
      // Saat alanını güncelleyen ve sayfayı yenileyen fonksiyon
      setState(() {
        saat = secilenSaat;
      });
    }
  }

  // Etkinlik ekleme sayfası için kullanılacak kaydetme fonksiyonu
  void kaydet() {
    // Formun doğruluğunu kontrol eden fonksiyon
    if (formKey.currentState!.validate()) {
      // Formdaki alanların değerlerini kaydeden fonksiyon
      formKey.currentState!.save();

      // Etkinlik nesnesi oluşturan fonksiyon
      final etkinlik = Etkinlik(baslik, aciklama, tarih, saat);

      // Etkinlik nesnesini ajanda sayfasına döndüren fonksiyon
      Navigator.pop(context, etkinlik);
    }
  }

  // Etkinlik ekleme sayfasının arayüzünü oluşturan fonksiyon
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Etkinlik Ekle'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Başlık',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  // Başlık alanının boş
                  if (value!.isEmpty) {
                    // Başlık alanı boşsa hata mesajı döndüren fonksiyon
                    return 'Lütfen bir başlık giriniz';
                  }
                  // Başlık alanı doluysa null döndüren fonksiyon
                  return null;
                },
                onSaved: (value) {
                  // Başlık alanının değerini kaydeden fonksiyon
                  baslik = value;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Açıklama',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  // Açıklama alanının boş olup olmadığını kontrol eden fonksiyon
                  if (value!.isEmpty) {
                    // Açıklama alanı boşsa hata mesajı döndüren fonksiyon
                    return 'Lütfen bir açıklama giriniz';
                  }
                  // Açıklama alanı doluysa null döndüren fonksiyon
                  return null;
                },
                onSaved: (value) {
                  // Açıklama alanının değerini kaydeden fonksiyon
                  aciklama = value;
                },
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Tarih',
                        border: OutlineInputBorder(),
                      ),
                      controller: TextEditingController(
                        text: tarih == null
                            ? ''
                            : DateFormat.yMd('tr_TR').format(tarih!),
                      ),
                      readOnly: true,
                      onTap: tarihSec,
                      validator: (value) {
                        // Tarih alanının boş olup olmadığını kontrol eden fonksiyon
                        /* if (value.isEmpty) {
                          // Tarih alanı boşsa hata mesajı döndüren fonksiyon
                          return 'Lütfen bir tarih seçiniz';
                        } */
                        // Tarih alanı doluysa null döndüren fonksiyon
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Saat',
                        border: OutlineInputBorder(),
                      ),
                      controller: TextEditingController(
                        text: saat == null ? '' : saat!.format(context),
                      ),
                      readOnly: true,
                      onTap: saatSec,
                      validator: (value) {
                        // Saat alanının boş olup olmadığını kontrol eden fonksiyon
                        if (value!.isEmpty) {
                          // Saat alanı boşsa hata mesajı döndüren fonksiyon
                          return 'Lütfen bir saat seçiniz';
                        }
                        // Saat alanı doluysa null döndüren fonksiyon
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Text('Kaydet'),
                onPressed: kaydet,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
