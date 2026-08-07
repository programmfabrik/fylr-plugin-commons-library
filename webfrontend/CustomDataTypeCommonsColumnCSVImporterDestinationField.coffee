class CustomDataTypeCommonsColumnCSVImporterDestinationField extends ObjecttypeCSVImporterDestinationField

    initOpts: ->
        super()
        @mergeOpt "field",
            check: CustomDataType

    supportsHierarchy: ->
        false

    formatValues: (values) ->
        data = []
        for value in values
            # several types of csv-input-data are supported:
            # 1. JSON object 
            #     {
            #       "conceptName": "Erbsen",
            #       "conceptURI": "http://vocab.getty.edu/tgn/7188765",
            #       ....
            #       ..
            #     }
            #      where conceptURI is mandatory, everything else optional
            # 2. only URI as string
            # 3. combination of Name and URI in the format "Name@$@URI"
            try
                #############################
                # case 1: JSON object
                json = JSON.parse(value)
                # check if json contains conceptURI                
                if json.conceptURI?
                    data.push(json)
            catch            
                # if data is string     
                if CUI.isString(value) 
                    #############################
                    # case 2: only URI as string
                    if CUI.parseLocation(value)
                        cdata = 
                            conceptURI: value
                        data.push(cdata)
                    #############################
                    # case 3: combination of Name and URI in the format "Name@$@URI"
                    else if value.indexOf("@$@") isnt -1
                        parts = value.split("@$@")
                        if parts.length is 2 and CUI.parseLocation(parts[1])
                            cdata =
                                conceptName: parts[0]
                                conceptURI: parts[1]
                            data.push(cdata)

        if data.length == 0
            return undefined
        else if data.length == 1
            return data[0]
        else
            return data