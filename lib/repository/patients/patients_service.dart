abstract class IPatientsService {
  Future<String> newPatient(
      String name, String nameMother, DateTime dataDascimento, int idade);
}
