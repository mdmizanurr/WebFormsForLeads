using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace API.Models
{

    [Table("Employee")]
    public class Employee
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [StringLength(100)]
        public string FirstName { get; set; } = String.Empty;

        [StringLength(50)]
        public string LastName { get; set; } = String.Empty;

        [StringLength(30)]
        public string Division { get; set; } = String.Empty;

        [StringLength(60)]
        public string Building { get; set; } = String.Empty;

        [StringLength(30)]
        public string Title { get; set; } = String.Empty;

        [StringLength(50)]
        public string Room { get; set; } = String.Empty;

        [StringLength(5)]
        public string IsActive { get; set; } = String.Empty;
    }
}
