namespace :slurp do
  desc "TODO"
  task techniques: :environment do
    
    require "csv"
    
    csv_text = File.read(Rails.root.join("lib","csvs","Techniques.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")

    csv.each do |row|
      t=Technique.new
      t.name = row["name"]
      t.save
      puts "#{t.name} saved"
    end

    puts "There are now #{Technique.count} rows in the techniques table."

  end

  task tastes: :environment do
    
    require "csv"
    
    csv_text = File.read(Rails.root.join("lib","csvs","tastes.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")

    csv.each do |row|
      puts row.to_h
      t=Taste.new
      t.name = row["name"]
      # puts t.name
      t.save
      puts "#{t.name} saved"
    end

    puts "There are now #{Taste.count} rows in the taste table."

  end
  
  task ingredients: :environment do
    
    require "csv"
    
    csv_text = File.read(Rails.root.join("lib","csvs","ingredients.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")

    csv.each do |row|
      # puts row.to_h
      t=Ingredient.new
      if row["name"].present?
        t.name = row["name"]
      end
      
      if row["weight"].present?
        t.weight = row["weight"]  
      end
      
      if row["volume"].present?
        t.volume = row["volume"]
      end
      
      if row["season"].present?
        t.season = row["season"]
      end
      
      if row["function"].present?
        t.function = row["function"]
      end
      
      if row["form"].present?
        t.form = row["form"]
      end
      t.save
      puts "#{t.name} saved"
    end

    puts "There are now #{Ingredient.count} rows in the ingredients table."

  end

  task pairings: :environment do
    
    require "csv"
    
    csv_text = File.read(Rails.root.join("lib","csvs","pairings1.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")

    csv.each do |row|
      # puts row.to_h

      # Does each ingredient exist?
      
      first = row["first"].downcase
      
      if Ingredient.find_by(:name => first).present?
        first_id = Ingredient.find_by(:name => first).id
      else
        i = Ingredient.new
        i.name = first
        i.save
        if Ingredient.find_by(:name => first).present?
          first_id = Ingredient.find_by(:name => first).id
          puts "I just created #{first} and its id is #{first_id}"
        else
          puts "Something else is wrong"
        end
      end
      
      second = row["second"].downcase

      if Ingredient.find_by(:name => second).present?
        second_id = Ingredient.find_by(:name => second).id
      else
        i = Ingredient.new
        i.name = second
        i.save
        if Ingredient.find_by(:name => second).present?
          second_id = Ingredient.find_by(:name => second).id
          puts "I just created #{second} and its id is #{second_id}"
        else
          puts "Something else is wrong"
        end
      end

      puts "Before sort #{first_id},#{second_id}"

      if first_id > second_id
        third_id = first_id
        first_id = second_id
        second_id = third_id
      end

      puts "After sort #{first_id},#{second_id}"
  
      add = 0
      
      if Pairing.find_by(:first_ingredient_id => first_id).present?
        first_set = Pairing.where(:first_ingredient_id => first_id)
        if first_set.find_by(:second_ingredient_id => second_id).present?
          puts "Pairing #{first}, #{second} already exists"
        else
          add = 1
        end
      else
        add = 1
      end
      
      if add == 1
        p=Pairing.new
        p.first_ingredient_id = first_id
        p.second_ingredient_id = second_id
        p.pairing_strength = row["strength"]
        p.save
        puts "Created pairing #{first}, #{second}"
      end


      # t.save
      # puts "#{t.name} saved"
    end

    puts "There are now #{Pairing.count} rows in the pairings table."

  end
  

end
