class Team < ActiveRecord::Base

  def self.get_round_of_16_teams tournament_name
    if tournament_name == 'MM 2014'
      return ['A1', 'B2', 'B1', 'A2', 'C1', 'D2', 'D1', 'C2', 'E1', 'F2', 'F1', 'E2', 'G1', 'H2', 'H1', 'G2']
    end
    if tournament_name == 'EM 2016'
      return ['Šveits', 'Poola', 'Horvaatia', 'Portugal', 'Wales', 'Põhja-Iirimaa', 'Ungari', 'Belgia', 'Saksamaa', 'Slovakkia', 'Itaalia', 'Hispaania', 'Prantsusmaa', 'Iirimaa', 'Inglismaa', 'Island']
    end
    if tournament_name == 'MM 2018'
      return ['Uruguay', 'Portugal', 'Hispaania', 'Venemaa', 'Prantsusmaa', 'Argentiina', 'Horvaatia', 'Taani', 'Brasiilia', 'Mehhiko', 'Rootsi', 'Šveits', 'Belgia', 'Jaapan', 'Kolumbia', 'Inglismaa']
    end
    if tournament_name == 'EM 2020'
      return ['Wales', 'Taani', 'Itaalia', 'Austria', 'Holland', 'Tsehhi', 'Belgia', 'Portugal', 'Horvaatia', 'Hispaania', 'Prantsusmaa', 'Šveits', 'Inglismaa', 'Saksamaa', 'Rootsi', 'Ukraina']
    end
    if tournament_name == 'MM 2022'
      return ['Holland', 'USA', 'Argentiina', 'Austraalia', 'Prantsusmaa', 'Poola', 'Inglismaa', 'Senegal', 'Jaapan', 'Horvaatia', 'Brasiilia', 'Lõuna-Korea', 'Maroko', 'Hispaania', 'Portugal', 'Šveits']
    end
    return []
  end
  
end