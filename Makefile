.PHONY: clean All

All:
	@echo "----------Building project:[ Orm - Debug ]----------"
	@"$(MAKE)" -f  "Orm.mk" && "$(MAKE)" -f  "Orm.mk" PostBuild
clean:
	@echo "----------Cleaning project:[ Orm - Debug ]----------"
	@"$(MAKE)" -f  "Orm.mk" clean
