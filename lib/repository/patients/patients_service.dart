abstract class IPatientsService {
  Future<String> newPatient(String name, String nameMother,
      String dataDascimento, String endereco, int idade);
}
