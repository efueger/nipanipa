# frozen_string_literal: true

#
# Tasks for loading geographical data into our database
#
namespace :db do
  def load_countries
    traverse(i18n_data["continents"]) do |con_code|
      continent = Continent.find_or_create_by!(code: con_code.upcase)

      traverse(i18n_data["countries"][con_code]) do |cou_code|
        Country.find_or_create_by!(code: cou_code.upcase,
                                   continent_id: continent.id)
      end
    end
  end

  def load_regions
    require "maxmind_importer"
    importer = Maxmind::Importer.new

    puts "Downloading regions..."
    importer.download!

    puts "Extracting information to disk..."
    importer.extract!

    puts "Loading regions into database..."
    importer.insert!
  end

  private

  def traverse(hash)
    hash.each { |code, _| yield(code) }
  end

  def i18n_data
    @i18n_data ||= YAML.safe_load(i18n_contents)["en"]
  end

  def i18n_contents
    @i18n_contents ||= File.read(Rails.root.join("config", "locales", "en.yml"))
  end

  namespace :maxmind do
    desc "Load country (and continent) info into db"
    task countries: :environment do
      puts "Loading country information from our YAML files..."
      load_countries
    end

    desc "Load regions into db"
    task regions: :environment do
      puts "Loading region information from Maxmind..."
      load_regions
    end
  end
end
