export PERL5LIB=../pegex-pm/lib

COMPILE_COMMAND = perl -MPegex::Compiler -e \
    'print Pegex::Compiler->compile_raw(shift)->to_

all: cdent.pgx.yaml cdent.pgx.json

%.pgx.yaml: %.pgx Makefile
	$(COMPILE_COMMAND)yaml' $< > $@

%.pgx.json: %.pgx Makefile
	$(COMPILE_COMMAND)json' $< > $@

clean:
	rm -f *.pgx.*
