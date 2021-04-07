[Mesh]
  type = GeneratedMesh
  dim = 2
  nx = 100
  ny = 100
  xmin = 0
  xmax = 1
  ymin = 0
  ymax = 1
[]

[Functions]
  [./ic_u]
    type = PiecewiseConstant
    axis = x
    direction = right
    xy_data = '0.1 0.0
               0.6 1.0
               1.0 0.0'
  [../]
[]

[Variables]
  [./u]
    order = FIRST
    family = LAGRANGE
  [../]
[]

[Kernels]
  [./time_u]
    type = TimeDerivative
    variable = u
  [../]

  [./adv_u]
    implicit = true
    type = ConservativeAdvection
    variable = u
    velocity = '1 0 0'
  [../]

  [./diff]
    type = Diffusion
    variable = u
  [../]
[]

[DGKernels]
  [./dg_advection_u]
    implicit = true
    type = DGConvection
    variable = u
    velocity = '1 0 0'
  [../]

  [./dg_diff]
    type = ADDGDiffusion
    variable = u
    epsilon = 1
    sigma = 1
    diff = 0.002
  [../]
[]

[ICs]
  [./u_ic]
    type = FunctionIC
    variable = u
    function = ic_u
  [../]
[]

[Executioner]
  type = Transient
  [./TimeStepper]
    type = SolutionTimeAdaptiveDT
    dt = 1e-3
  [../]
  solve_type = 'PJFNK'
  petsc_options_iname = '-pc_type -pc_hypre_type' # PETSc option pairs with values below
  petsc_options_value = ' hypre   boomeramg'
  num_steps = 200
  automatic_scaling = true
  start_time = 0.0
  dtmin = 1e-4
  dtmax = 0.01
  end_time = 0.2
[]

[Outputs]
  exodus = true
[]
