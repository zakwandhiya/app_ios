

class Get_user_biodata_responseModel{
	String namaOrangTuaWali;
	String emailOrangTuaWali;
	int id;
	String facebookId;
	String email;
	String emailAlternatif;
	String alamatOrangTua;
	int userId;
	String asalSma;
	String instagramId;
	String dateCreated;
	String nim;
	String nama;
	String hobby;
	String kegiatanEkskul;
	String dateModified;
	String prodi;
	String nomorHpOrangTuaWali;
	String alamatMalang;
	String status;
	String nikNip;
	String lineId;
	String profilePic;
	String nomorHp;
	String alamatAsal;

	Get_user_biodata_responseModel({
		required this.namaOrangTuaWali,
		required this.emailOrangTuaWali,
		required this.id,
		required this.facebookId,
		required this.email,
		required this.emailAlternatif,
		required this.alamatOrangTua,
		required this.userId,
		required this.asalSma,
		required this.instagramId,
		required this.dateCreated,
		required this.nim,
		required this.nama,
		required this.hobby,
		required this.kegiatanEkskul,
		required this.dateModified,
		required this.prodi,
		required this.nomorHpOrangTuaWali,
		required this.alamatMalang,
		required this.status,
		required this.nikNip,
		required this.lineId,
		required this.profilePic,
		required this.nomorHp,
		required this.alamatAsal,
	});

	Map<String,dynamic> toJson(){
		

		return {
			"nama_orang_tua_wali" : namaOrangTuaWali,
			"email_orang_tua_wali" : emailOrangTuaWali,
			"id" : id,
			"facebook_id" : facebookId,
			"email" : email,
			"email_alternatif" : emailAlternatif,
			"alamat_orang_tua" : alamatOrangTua,
			"user_id" : userId,
			"asal_sma" : asalSma,
			"instagram_id" : instagramId,
			"date_created" : dateCreated,
			"nim" : nim,
			"nama" : nama,
			"hobby" : hobby,
			"kegiatan_ekskul" : kegiatanEkskul,
			"date_modified" : dateModified,
			"prodi" : prodi,
			"nomor_hp_orang_tua_wali" : nomorHpOrangTuaWali,
			"alamat_malang" : alamatMalang,
			"status" : status,
			"nik_nip" : nikNip,
			"line_id" : lineId,
			"profile_pic" : profilePic,
			"nomor_hp" : nomorHp,
			"alamat_asal" : alamatAsal,
		};
	}

	factory Get_user_biodata_responseModel.fromJson(Map<String, dynamic> data){
		

		Get_user_biodata_responseModel getUserBiodataResponseModel = Get_user_biodata_responseModel(
			namaOrangTuaWali : data['nama_orang_tua_wali'],
			emailOrangTuaWali : data['email_orang_tua_wali'],
			id : data['id'],
			facebookId : data['facebook_id'],
			email : data['email'],
			emailAlternatif : data['email_alternatif'],
			alamatOrangTua : data['alamat_orang_tua'],
			userId : data['user_id'],
			asalSma : data['asal_sma'],
			instagramId : data['instagram_id'],
			dateCreated : data['date_created'],
			nim : data['nim'],
			nama : data['nama'],
			hobby : data['hobby'],
			kegiatanEkskul : data['kegiatan_ekskul'],
			dateModified : data['date_modified'],
			prodi : data['prodi'],
			nomorHpOrangTuaWali : data['nomor_hp_orang_tua_wali'],
			alamatMalang : data['alamat_malang'],
			status : data['status'],
			nikNip : data['nik_nip'],
			lineId : data['line_id'],
			profilePic : data['profile_pic'],
			nomorHp : data['nomor_hp'],
			alamatAsal : data['alamat_asal'],
		);
		return getUserBiodataResponseModel;
	}
}
