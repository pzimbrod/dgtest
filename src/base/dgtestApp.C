#include "dgtestApp.h"
#include "Moose.h"
#include "AppFactory.h"
#include "ModulesApp.h"
#include "MooseSyntax.h"

InputParameters
dgtestApp::validParams()
{
  InputParameters params = MooseApp::validParams();

  // Do not use legacy DirichletBC, that is, set DirichletBC default for preset = true
  params.set<bool>("use_legacy_dirichlet_bc") = false;

  // Do not use legacy material output, i.e., output properties on INITIAL as well as TIMESTEP_END
  params.set<bool>("use_legacy_material_output") = false;

  return params;
}

dgtestApp::dgtestApp(InputParameters parameters) : MooseApp(parameters)
{
  dgtestApp::registerAll(_factory, _action_factory, _syntax);
}

dgtestApp::~dgtestApp() {}

void
dgtestApp::registerAll(Factory & f, ActionFactory & af, Syntax & syntax)
{
  ModulesApp::registerAll(f, af, syntax);
  Registry::registerObjectsTo(f, {"dgtestApp"});
  Registry::registerActionsTo(af, {"dgtestApp"});

  /* register custom execute flags, action syntax, etc. here */
}

void
dgtestApp::registerApps()
{
  registerApp(dgtestApp);
}

/***************************************************************************************************
 *********************** Dynamic Library Entry Points - DO NOT MODIFY ******************************
 **************************************************************************************************/
extern "C" void
dgtestApp__registerAll(Factory & f, ActionFactory & af, Syntax & s)
{
  dgtestApp::registerAll(f, af, s);
}
extern "C" void
dgtestApp__registerApps()
{
  dgtestApp::registerApps();
}
