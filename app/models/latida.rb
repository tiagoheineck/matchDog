class Latida < ActiveRecord::Base
    #attr_accessible :match, :de_dog, :para_dog, :mensagem, :enviada_em, :lida_em
    
    belongs_to :match
    belongs_to :de_dog
    belongs_to :para_dog
    
    def get_latidas_count(cachorros)
        aux = []
        cachorros.each do |d|
           aux.push(d.id)
        end
        cachorros = aux.join(",")
        Latida.where("(para_dog_id IN (#{cachorros}) AND lida_em IS NULL)").count
    end
    
end
