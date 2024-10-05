using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace API.Migrations
{
    /// <inheritdoc />
    public partial class initial : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Employee",
                columns: table => new
                {
                    Id = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    FirstName = table.Column<string>(type: "NVARCHAR2(100)", maxLength: 100, nullable: false),
                    LastName = table.Column<string>(type: "NVARCHAR2(50)", maxLength: 50, nullable: false),
                    Division = table.Column<string>(type: "NVARCHAR2(30)", maxLength: 30, nullable: false),
                    Building = table.Column<string>(type: "NVARCHAR2(60)", maxLength: 60, nullable: false),
                    Title = table.Column<string>(type: "NVARCHAR2(30)", maxLength: 30, nullable: false),
                    Room = table.Column<string>(type: "NVARCHAR2(50)", maxLength: 50, nullable: false),
                    IsActive = table.Column<string>(type: "NVARCHAR2(5)", maxLength: 5, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Employee", x => x.Id);
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Employee");
        }
    }
}
