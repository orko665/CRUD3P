using CRUD.Model.Dto;
using FluentValidation;

namespace CRUD.Validaciones
{
    public class ClienteDtoValidator : AbstractValidator<ClienteDto>
    {
        public ClienteDtoValidator()
        {
            RuleFor(x => x.id_banco).NotEmpty();
            RuleFor(x => x.nombre).NotEmpty().MinimumLength(3);
            RuleFor(x => x.apellido).NotEmpty().MinimumLength(3);
            RuleFor(x => x.documento).NotEmpty().MinimumLength(7);
            RuleFor(x => x.mail).NotEmpty().EmailAddress();
            RuleFor(x => x.celular).NotEmpty().Length(10).Matches("^[0-9]*$");
            RuleFor(x => x.estado).NotEmpty();
        }
    }
}
