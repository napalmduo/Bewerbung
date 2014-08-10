xml.instruct!
xml.projects do
  @project.each do |project|
    xml.project do
      xml.name project.Name
      xml.texts do
        project.texts.each do |text|
          xml.text do
            xml.titel text.titel
            xml.text text.text
          end
        end
      end
    end
  end
end