vars = Array{Any,1}()
vals = Array{Any,1}()

c = 0

for line in eachline(STDIN)
	if ismatch(r"======", line)
		if length(vars) > 0
			if c == 0
				println(STDOUT, "| " * join(vars, " | ") * " |")
				println(STDOUT, "|" * repeat("--|", length(vars)))
				c += 1
			end

			println(STDOUT, "| " * join(vals, " | ") * " |")

			empty!(vars)
			empty!(vals)
		end
	elseif ismatch(r"hostname|jobnumber|jobname|ru_wallclock|maxvmem|taskid", chomp(line))
		m = match(r"([^ ]+) +([^ ]+)", chomp(line)).captures
		push!(vars, m[1])
		push!(vals, m[2])
	end
end

if length(vars) > 0
	if c == 0
				println(STDOUT, "| " * join(vars, " | ") * " |")
				println(STDOUT, "|" * repeat("--|", length(vars)))
				c += 1
	end

	println(STDOUT, "| " * join(vals, " | ") * " |")

	empty!(vars)
	empty!(vals)
end
