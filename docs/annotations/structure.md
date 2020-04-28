# Structure of a Gem
 
Each Gem has a:

* Name.
* Version.
* Plataform.

For exemple, the rake gem has a 0.8.7 version (from May, 2009). Rake's plataform is ruby, which means it works on any plataform Ruby runs on.

Plataforms are based on the CPU architecture, operating system type and sometimes the operating system version. The plataform indicates the gem only works with a Ruby built for the same plataform.

Inside gems are the following components:

* Code (including tests and supporting utilities).
* Documentation.
* gemspec.

Each gem follows the same standard strucutre of code organization:

```txt
% tree freewill
freewill/
├── bin/
│   └── freewill
├── lib/
│   └── freewill.rb
├── test/
│   └── test_freewill.rb
├── README
├── Rakefile
└── freewill.gemspec
```
