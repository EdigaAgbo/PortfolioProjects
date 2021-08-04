Select *
From portfolio_project.covid_deaths
Where continent != '0' 
order by 3,4

-- CovidDeath probability per country

Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
From portfolio_project.covid_deaths


-- Showing what population of the country has contracted covid 
Select location, date, total_cases, population, (total_cases/population)*100 AS InfectedPercentage
From portfolio_project.covid_deaths


-- Looking for countries with the highest infection rates compared to population 
Select location, population, Max(total_cases) AS HighestInfectionCount,  Max((total_cases/population))*100 as PercentagePopulationInfected
From portfolio_project.covid_deaths
Group by location, population
 Order by PercentagePopulationInfected DESC

-- Showing the number of infected people that actually died from covid 
Select location, Max((total_deaths)) AS TotalDeathCount
From portfolio_project.covid_deaths
Where continent != '0'
Group by location
 Order by TotalDeathCount DESC
 
 -- Showing the continent with the highest death per population
 Select continent, Max((total_deaths)) AS TotalDeathCount
From portfolio_project.covid_deaths
Where continent != '0'
Group by continent
 Order by TotalDeathCount DESC

-- Global numbers
Select date, SUM(new_cases) AS Total_cases, SUM(new_deaths) AS Total_deaths, SUM(new_deaths)/ SUM(new_cases) * 100 AS DeathPercentage
From portfolio_project.covid_deaths
where continent != '0'
group by date

-- Showing individuals that have been Vaccinated
From portfolio_project.covid_deaths dea
Join portfolio_project.covid_vaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
Where dea.continent != '0'


-- Creating view to strore data for later visualization
Create View DeathPercentPerCountry as
Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
From portfolio_project.covid_deaths


