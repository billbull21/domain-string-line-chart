class MahasiswaModel {
    int index;
    int iD_MHS;
    String nIM_MHS;
    int iD_SEMESTER;
    String tAHUN_AJARAN;
    String gROUP_SEMESTER;
    String iPS_MHS;

    MahasiswaModel({this.index, this.iD_MHS, this.nIM_MHS, this.iD_SEMESTER, this.tAHUN_AJARAN, this.gROUP_SEMESTER, this.iPS_MHS});

    factory MahasiswaModel.fromJson(Map<String, dynamic> json) {
        return MahasiswaModel(
            index: json['index'], 
            iD_MHS: json['ID_MHS'],
            nIM_MHS: json['NIM_MHS'],
            iD_SEMESTER: json['ID_SEMESTER'],
            tAHUN_AJARAN: json['TAHUN_AJARAN'],
            gROUP_SEMESTER: json['GROUP_SEMESTER'],
            iPS_MHS: json['IPS_MHS'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['index'] = this.index;
        data['ID_MHS'] = this.iD_MHS;
        data['NIM_MHS'] = this.nIM_MHS;
        data['ID_SEMESTER'] = this.iD_SEMESTER;
        data['TAHUN_AJARAN'] = this.tAHUN_AJARAN;
        data['GROUP_SEMESTER'] = this.gROUP_SEMESTER;
        data['IPS_MHS'] = this.iPS_MHS;
        return data;
    }
}