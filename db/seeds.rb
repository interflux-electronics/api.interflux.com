# frozen_string_literal: true

Product.all.delete_all

IF_2005M = Product.create!(
  name: 'IF 2005M',
  slug: 'IF-2005M',
  public: true,
  product_type: 'soldering-flux',
  pitch: 'Interflux® IF 2005M is the **internationally renowned** resin- and rosin-free, no-clean / No-residue™ **flux standard**.'
)

OSPI_3311M = Product.create!(
  name: 'OSPI 3311M',
  slug: 'OSPI-3311M',
  public: true,
  product_type: 'soldering-flux',
  pitch: 'Interflux® OSPI 3311M is an alcohol based no-clean flux for **soldering OSP** finished boards that have passed one or more reflow cycles.'
)

DP_5600 = Product.create!(
  name: 'DP 5600',
  slug: 'DP-5600',
  public: true,
  product_type: 'solder-paste',
  pitch: 'Interflux® DP 5600 is a no-clean solder paste for **low temperature SnBi(Ag)** alloys.'
)

QF_60 = Product.create!(
  name: 'QF 70',
  slug: 'QF-70',
  public: true,
  product_type: 'solder-wire',
  pitch: 'Interflux® **QF 70** is an absolutely halide-free, rosin based no-clean solder wire with **fast wetting for fast soldering** operations in lead-free alloys.'
)

QF_50 = Product.create!(
  name: 'QF 50',
  slug: 'QF-50',
  public: false,
  product_type: 'solder-wire',
  pitch: 'Interflux® **QF 50** is an absolutely halide-free, rosin based no-clean solder wire with **fast wetting for fast soldering** operations in lead-free alloys.'
)
