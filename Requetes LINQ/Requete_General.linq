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

void Main()
{
    int? productId = null; 
    int? versionId = null;
    string status = null; 
    DateTime? startDate = null;
    DateTime? endDate = null;
    List<string> keywords = new List<string>{};

	// 🧱 Base de la requête
	var query = Tickets.AsQueryable();

	if (productId.HasValue)
	{
	query = query.Where(t => t.VersionsOS.Product.Id == productId.Value);
	}

	if (versionId.HasValue)
	{
	query = query.Where(t => t.VersionsOS.Version.Id == versionId.Value);
	}

	if (!string.IsNullOrEmpty(status))
	{
		query = query.Where(t => t.Status.Name == status);
		var start = startDate.HasValue ? DateOnly.FromDateTime(startDate.Value) : (DateOnly?)null;
		var end = endDate.HasValue ? DateOnly.FromDateTime(endDate.Value) : (DateOnly?)null;

		if (start.HasValue && end.HasValue)
		{
			if (status == "En cours")
			{
			query = query.Where(t => t.Date_create >= start && t.Date_create <= end);
			}
			else if (status == "Résolu")
			{
			query = query.Where(t => t.Date_end >= start && t.Date_end <= end);
			}
		}
	}
	else
	{
		// Pas de status => on prend tickets dans la période sur date_create ou date_end
		if (startDate.HasValue && endDate.HasValue)
		{
			var start = DateOnly.FromDateTime(startDate.Value);
			var end = DateOnly.FromDateTime(endDate.Value);

			query = query.Where(t =>
			(t.Date_create >= start && t.Date_create <= end) ||
			(t.Date_end >= start && t.Date_end <= end));
		}
	}


	// 💡 Exécuter requête SQL ici
	var filteredTickets = query.ToList();

	// 🎯 Filtrage par mots-clés en mémoire
	if (keywords != null && keywords.Any())
    {
        filteredTickets = filteredTickets
            .Where(t => keywords.Any(k => t.Problem != null && t.Problem.Contains(k, StringComparison.OrdinalIgnoreCase)))
				.ToList();
				}

	// 🔎 Projection finale
	var result = filteredTickets.Select(t => new
	{
	t.Id,
	Product = t.VersionsOS.Product.Name,
	t.Date_create,
	t.Date_end,
	Version = t.VersionsOS.Version.Number_version,
	OS = t.VersionsOS.Operating_system.Name_os,
	Status = t.Status?.Name,
	t.Problem,
	});

	result.Dump();
}
			