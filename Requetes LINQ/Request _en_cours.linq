<Query Kind="Program">
  <Connection>
    <ID>b2f1e32e-5d02-48d2-8d87-5227e3dd67ff</ID>
    <NamingServiceVersion>2</NamingServiceVersion>
    <Persist>true</Persist>
    <Server>.</Server>
    <AllowDateOnlyTimeOnly>true</AllowDateOnlyTimeOnly>
    <Database>TicketsSupport</Database>
    <DriverData>
      <LegacyMFA>false</LegacyMFA>
    </DriverData>
  </Connection>
</Query>

// Méthode générique qui construit et exécute la requête, puis renvoie les résultats
IEnumerable<object>
	PrintTickets(
	int? productId = null,
	int? versionId = null,
	string status = null,
	DateTime? startDate = null,
	DateTime? endDate = null,
	List<string>
keywords = null)
{
	var query = Tickets.AsQueryable();

	if (productId.HasValue)
	query = query.Where(t => t.Product_id == productId.Value);

	if (versionId.HasValue)
	query = query.Where(t => t.Version_id == versionId.Value);

	DateOnly? start = startDate.HasValue ? DateOnly.FromDateTime(startDate.Value) : null;
	DateOnly? end = endDate.HasValue ? DateOnly.FromDateTime(endDate.Value) : null;

	// Filtre status + date
	if (!string.IsNullOrEmpty(status))
	{
	query = query.Where(t => t.Status.Name == status);

		if (start.HasValue && end.HasValue)
		{
			if (status == "En cours")
			query = query.Where(t => t.Date_create >= start && t.Date_create <= end);
			else if (status == "Résolu")
			query = query.Where(t => t.Date_end >= start && t.Date_end <= end);
		}
	}
	else
	{
		// Pas de status précisé
		if (start.HasValue && end.HasValue)
		{
			// On veut tous les tickets dans la période (résolu ou en cours)
			query = query.Where(t =>
			(t.Date_create >= start && t.Date_create <= end)
			|| (t.Date_end >= start && t.Date_end <= end)
			);
		}
	}

	var filteredTickets = query.ToList();

	if (keywords != null && keywords.Any())
	{
		filteredTickets = filteredTickets
			.Where(t => keywords.Any(k => t.Problem != null && t.Problem.Contains(k, StringComparison.OrdinalIgnoreCase)))
			.ToList();
	}

	return filteredTickets.Select(t => new
	{
		t.Id,
		Product = t.Product?.Name,
		t.Date_create,
		t.Date_end,
		Version = t.Version?.Number_version,
		Status = t.Status?.Name,
		t.Problem,
	});
}

// Fonction Main qui teste plusieurs cas d’usage
void Main()
{

	// Requetes : tous les tickets avec status "En cours", par produit, puis version
	PrintTickets(productId: 4, versionId: 2 , status: "En cours").Dump();

	// Requetes : tickets pour un produit sur une période donnée et une version précise
	PrintTickets(
		productId: 4,
		startDate: new DateTime(2023, 01, 01),
		endDate: new DateTime(2025, 06, 30),
		versionId: 2
	).Dump();
	
	// Requetes : tickets EN COURS pour un produit, une version précise et avec mots-clés
    PrintTickets(
		productId: 2,
        status: "En cours",
        keywords: new List<string> { "utilisateur", "bug" },
		versionId: 1
    ).Dump();
	
	// Requetes : tickets pour un produit avec une période donnée, une version et avec mots-clés
    PrintTickets(
		productId: 1,
		versionId: 4,
		startDate: new DateTime(2023, 01, 01),
        endDate: new DateTime(2025, 06, 30),
        keywords: new List<string> { "application", "bug" }
    ).Dump();
}
