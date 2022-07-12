using CRUDOperacionesSP.Context;
using CRUDOperacionesSP.Models;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;

namespace CRUDOperacionesSP.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class PersonasCRUDController : ControllerBase
    {
        ApplicationDbConnection dbContext = new ApplicationDbConnection();
        // GET: PersonasController

        [HttpGet]
        public ActionResult Index()
        {
            List<Persona> personaList = dbContext.MostrarPesonas().ToList();
            return Ok(personaList);
        }
                             
        // POST: PersonasController/Create
        [HttpPost]
        public ActionResult Create([Bind] Persona persona)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    dbContext.InsetarPersona(persona);
                    return RedirectToAction("Index");
                }
                return Ok(persona);
            }
            catch
            {
                return Ok();
            }
        }
                
        // POST: PersonasController/Edit/5
        [HttpPut("{id}")]
        
        public ActionResult Put(int id, [Bind] Persona persona)
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

                return Ok(dbContext);

            }
            catch
            {
                return Ok();
            }
        }
               
        // POST: PersonasController/Delete/5
        [HttpDelete, ActionName("Delete")]
        
        public ActionResult DeleteConfirmed(int id)
        {
            try
            {
                dbContext.BorrarPersona(id);
                return RedirectToAction("Index");
            }
            catch
            {
                return Ok();
            }
        }
    }
}
