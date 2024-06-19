using CRUD.Model.Dto;
using FluentValidation;

namespace CRUD.Validaciones
{
    public class FacturaDtoValidator : AbstractValidator<FacturaDto>
    {
        public FacturaDtoValidator()
        {
            RuleFor(x => x.nro_factura).Matches(@"^\d{3}-\d{3}-\d{6}$").WithMessage("El número de factura no cumple con el formato especificado");
            RuleFor(x => x.total).NotEmpty();
            RuleFor(x => x.total_iva5).NotEmpty();
            RuleFor(x => x.total_iva10).NotEmpty();
            RuleFor(x => x.total_iva).NotEmpty();
            RuleFor(x => x.total_letras).NotEmpty();
        }
    }
}
