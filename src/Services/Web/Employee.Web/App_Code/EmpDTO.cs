using Newtonsoft.Json;


public class EmpDTO
{

    [JsonProperty]
    public int Id { get; set; }

    [JsonProperty]
    public string FirstName { get; set; }

    [JsonProperty]
    public string LastName { get; set; }

    [JsonProperty]
    public string Division { get; set; }

    [JsonProperty]
    public string Building { get; set; }

    [JsonProperty]
    public string Title { get; set; }

    [JsonProperty]
    public string Room { get; set; }

    [JsonProperty]
    public string IsActive { get; set; }

}


public class EmpCreate
{
    [JsonProperty]
    public string FirstName { get; set; }

    [JsonProperty]
    public string LastName { get; set; }

    [JsonProperty]
    public string Division { get; set; }

    [JsonProperty]
    public string Building { get; set; }

    [JsonProperty]
    public string Title { get; set; }

    [JsonProperty]
    public string Room { get; set; }

    [JsonProperty]
    public string IsActive { get; set; }
}