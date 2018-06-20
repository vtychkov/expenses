using Microsoft.AspNetCore.Mvc;

namespace Expenses.WebApp.Controllers
{
    public class HomeController : Controller
    {
        public ViewResult Index()
        {
            var repo = new UserRepository();
            return View(repo.GetAll());
        }
    }
}
