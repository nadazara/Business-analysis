
		 select *
		from dbo.CovidDeaths$
		order by 1,2



		-- Looking for data we need 

			select Location , date ,total_cases , new_cases , total_deaths , population
			from dbo.CovidDeaths$
			order by 1,2


		-- looking for total cases vs total deaths
		-- calcualte percentage of total deaths

		select Location , date ,total_cases , total_deaths , (total_deaths/total_cases)*100 as percentage_deaths
		from dbo.CovidDeaths$
		where Location like '%States%'
		order by 1,2


		-- looking for total cases vs population
		--calculate percentage population

		select Location , date ,total_cases , population, (total_cases/population)*100 as percentage_population
		from dbo.CovidDeaths$
		order by 1,2

		-- countries with highest infected compare population 

	select Location ,population , max(total_cases)as highest_infected ,max(total_cases/population)*100 as percentage_population_infected
	from dbo.CovidDeaths$
	group by Location , population
     order by percentage_population_infected desc

		-- countries with highest deaths compare population 
		 
		 select Location , max(cast(total_deaths as int)) as highest_deaths ,max(total_deaths/population)*100 as percentage_population_deaths
		 from dbo.CovidDeaths$
		 where continent is not null
		 group by Location , population
		 order by percentage_population_deaths desc

		 --showing the highest deaths with every continent

		  select continent , max(cast(total_deaths as int)) as highest_deaths 
		 from dbo.CovidDeaths$
		where continent is not null
		group by continent
		order by highest_deaths desc

		-- Globel numbers

		select sum(cast(new_cases as int))as total_cases ,sum(cast(new_deaths as int))as total_deaths ,sum (cast(new_deaths as int))/sum(New_cases)*100 as percentage_of_deaths
		from dbo.CovidDeaths$
		where continent is not null
		order by 1,2

		-- Looking for Total vaccanation vs population

		select *
		from dbo.CovidVaccinations$

		select *
		from dbo.CovidDeaths$ dea
		join dbo.CovidVaccinations$ vac
		on dea.Location = vac.Location 
		and dea.date = vac.date


		select dea.location , dea.date , population , vac.new_vaccinations ,
		sum(cast(vac.new_vaccinations as int)) over (partition by dea.Location) as All_vaccinated
		from dbo.CovidDeaths$ dea
		join dbo.CovidVaccinations$ vac
		on dea.Location = vac.Location 
		where dea.continent is not null
		and dea.date = vac.date


		-- with CTE

		with PopvsVac as (
		
		select dea.location , dea.date , population , vac.new_vaccinations ,
		sum(cast(vac.new_vaccinations as int)) over (partition by dea.Location) as All_vaccinated
		from dbo.CovidDeaths$ dea
		join dbo.CovidVaccinations$ vac
		on dea.Location = vac.Location 
		where dea.continent is not null
		and dea.date = vac.date	
		)
		select * ,( All_vaccinated/population) *100 as percentage_vaccination
		from PopvsVac

		-- Temp Table

		drop table if exists #percentage_vaccination 
		create table #percentage_vaccination(
		Location nvarchar(99),
		date datetime,
		popultion numeric,
		new_vaccinations numeric,
		All_vaccinated numeric  
		)

		insert into #percentage_vaccination
		
		select dea.location , dea.date , population , vac.new_vaccinations ,
		sum(cast(vac.new_vaccinations as int)) over (partition by dea.Location) as All_vaccinated
		from dbo.CovidDeaths$ dea
		join dbo.CovidVaccinations$ vac
		on dea.Location = vac.Location 
		where dea.continent is not null
		and dea.date = vac.date	

		select *
		from #percentage_vaccination 
		order by All_vaccinated desc

		-- create view for visulization

		create view percentage_vaccination as 

		select dea.location , dea.date , population , vac.new_vaccinations ,
		sum(cast(vac.new_vaccinations as int)) over (partition by dea.Location) as All_vaccinated
		from dbo.CovidDeaths$ dea
		join dbo.CovidVaccinations$ vac
		on dea.Location = vac.Location 
		where dea.continent is not null
		and dea.date = vac.date	

		




