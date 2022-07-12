using CRUDOperacionesSP.Context;
using CRUDOperacionesSP.Models;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;

namespace CRUDOperacionesSP.Controllers
{
    
    public class PersonasController : Controller
    {
        ApplicationDbConnection dbContext = new ApplicationDbConnection();
        // GET: PersonasController
        [HttpGet]

        public ActionResult Index()
        {
            List<Persona> personaList = dbContext.MostrarPesonas().ToList();
            return View(personaList);
        }

        // GET: PersonasController/Details/5
        public ActionResult Details(int id)
        {
            if (id <= 0)
            {
                return NotFound();
            }

            Persona persona = dbContext.Persona_Id(id);
            if (persona == null)
            {
                return NotFound();
            }
            return View(persona);
        }

        // GET: PersonasController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: PersonasController/Create
        [HttpPost]
        [IgnoreAntiforgeryToken]

        public ActionResult Create([Bind] Persona persona)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    dbContext.InsetarPersona(persona);
                    return RedirectToAction("Index");
                }
                return View(persona);
            }
            catch
            {
                return View();
            }
        }

        // GET: PersonasController/Edit/5
        public ActionResult Edit(int id)
        {
            if (id <= 0)
            {
                return NotFound();
            }

            Persona persona = dbContext.Persona_Id(id);
            if (persona == null)
            {
                return NotFound();
            }
            
            return View(persona);
        }

        // POST: PersonasController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, [Bind] Persona persona)
        {
            try
            {
                if (id <= 0)
                {
                    return NotFound();
                }
                if (ModelState.IsValid)
                {
                    dbContext.ActulizarPersona(persona);
                    return RedirectToAction(nameof(Index));
                }

                return View(dbContext);
               
            }
            catch
            {
                return View();
            }
        }

        // GET: PersonasController/Delete/5
        public ActionResult Delete(int id)
        {
            if (id <= 0)
            {
                return NotFound();
            }
            Persona persona = dbContext.Persona_Id(id);
            if (persona == null)
            {
                return NotFound();
            
            }
            return View(persona);
        }

        // POST: PersonasController/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            try
            {
                dbContext.BorrarPersona(id);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
