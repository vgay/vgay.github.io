
\version "2.22.1"
#(set-global-staff-size 18)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
}

title = #"La non-demande en mariage"
composer = #"Georges Brassens"
meter = #"(Med. Swing)"
kwtempo = #"Medium"
kwstyle = #"Swing"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  % asplayed = #"" % doit être commentée si vide
  url = #""
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
    %voltaSpannerDuration = #(ly:make-moment 4 4)
    \override Glissando #'style = #'zigzag
    \override Glissando.breakable = ##t
    \override Glissando.after-line-breaking = ##t
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
  }
  \context { 
    \Staff
    printPartCombineTexts = ##f
    \consists "Merge_rests_engraver"
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
  \context { \Score markFormatter = #format-mark-box-alphabet }
  %   \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
  %              \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  %   }
}

\defineBarLine "||-[|:" #'("||" "[|:" "[|:") 

form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##f
  r1*4 e2:m e:m7+ e:m7 e:m6 b:m b:m7+ b:m7 b:m6 fis fis:7+ fis:7 fis:6 b1:m7
  s b:m7 b:7 
  e:m7 a:7 d:7+ fis:9- b:m fis:9- b:m s b:m r

}


theNotes =  \relative c'' {
  \override MultiMeasureRest #'expand-limit = #3
  \clef "treble" \key d \major \time 4/4
  \mark \markup \bold \box Intro
  \inlineMMRN R1*4 \mark #1 \break 
  \repeat volta 2 {
    r4. g8 b b b b | e4 8 g~ g2 |
    r4. fis,8 b b b b | d4 8 fis~ fis2 | \break
    cis1~ | 4 r fis4. cis8 | 
  }
  \alternative {
    { b2( d8 b4.) | fis1 }
    { b1 r2 r8 b e fis}
  }
  \bar "||" \break \mark #2
  g2 fis8 e4 fis8 | g2~ 8 a4. | fis4. b8~ 2 | e,1 | \break
  r4 r8 b cis d fis b | cis,4. e8 cis a a b | b1 | 
  \toCoda
  R1 \bar "|." \break
  \Coda \inlineMMRN R1*3
  \bar ".."
}

chordsRhythm = \relative c'' {
  \key d \major
  %\improvisationOn \override NoteHead.no-ledgers = ##t 
  \mark \markup \bold \box Intro
  R1*4 \mark #1
  <g b e'>2 <g b dis'> <g b d'>2 <g b cis'>
  <d' fis b> <d fis bes> <d fis a> <d fis gis>
  <ais cis fis> <ais cis f> <ais cis e> <ais es'>
  \repeat unfold 6 <fis a d> \repeat unfold 2 <fis a dis>
  \mark #2 <b d g>2. q4 <e, a cis g'>4. q8~ q2
  <d a' cis fis>2. q4
  <ais' cis e>2 r8 <ais e' g>4.
  <b d fis>2. q4
  <ais cis e>4. <ais e' g>8 q2
  <b d fis>4. q8 q2 | <b d fis>4. q8 q2
  <b d fis>1 R R
  
}

Basse = \relative c' {
  %\override Rest #'staff-position = #0
  \clef "bass" \key d \major \time 4/4
  \repeat unfold 3 { b4. 8 4. r8 } | b4. 8 8 a g fis \break \bar "||-[|:"
  \repeat volta 2 {
    \repeat unfold 2 { e4. 8 4. r8 }
    \repeat unfold 2 { b'4. 8 4. r8 } \break
    \repeat unfold 2 { fis4. 8 4. r8 } }
  \alternative { 
    { b4. 8 4. r8  | b4. 8 8 a g fis }
    { \repeat unfold 2 { b4. 8 4. r8 } } 
  } \break \bar "||"
  e,4. b'8~ 4 g | a4. e8~ 4 cis | d4. a'8~ 4 d, | fis4. cis8~ 4 fis | \break
  b,4. fis'8~ 4 d | fis4. cis8~ 4 fis |
  b4. 8 4. r8  \toCoda | b4. 8 8 a g fis \break
  \Coda
  \repeat unfold 2 { b4. 8 4. r8 } | b4. 8 2 \fermata
  
}

grille = \chordmode {
  \bar "[|:"
  \/e2:m e:m7+ \/e:m7 e:m6 \/b2:m b:m7+ \/b:m7 b:m6 \break
  \/fis2:9- fis \/fis:7+ fis:7 bes1:m7 
  \set Score.repeatCommands = #'((volta "1")) 
  bes:m7   \set Score.repeatCommands = #'((volta #f) end-repeat) \break
  \stopStaff s \bar "" s \bar "" s \startStaff 
  \set Score.repeatCommands = #'((volta "2")) b:7
  \set Score.repeatCommands = #'((volta #f)) \bar "||" \break
  e:m7 a:7 d:7+ fis:9- \break
  b:m fis:9- \repeat percent 2 b:m
 
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*11 
  s1 ^\markup \bold \box \fontsize #7 B 
}


verse = \lyricmode {
  Ma mie, de grâ -- ce, ne met -- tons __
  pas sous la gor -- ge_à Cu -- pi -- don __
  sa pro -- pre flè -- che.
  \repeat unfold 4 { \skip 1 }

  de
  ne pas te de-
  -man -- der ta main.
  Ne gra -- vons pas
  nos noms au bas
  "d'un" par -- che -- min. 
}

verseB = \lyricmode {
  Tant d'a -- mou -- reux l'ont es -- say -- ée __
  qui, de leur bon -- heur ont pa -- yé __
  ce sa -- cri \repeat unfold 2 { \skip 1 } lège.

  J'ai l'hon -- neur 
}

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "BbTab") 
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c a \theNotes
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >>
      >>
    } %\form
    %}  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Bba4") 
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
        >> 
      >>
    } %\form
    %}  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \transpose c d \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice  
          \transpose c a \theNotes
        >> 
      >>
    } %\form
    %}  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \transpose c a \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "RSa4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = Guitare } 
          <<
            %\new Voice \with { \consists "Pitch_squash_engraver" } 
            \chordsRhythm
          >>
          \new TabStaff \transpose c c, \chordsRhythm
        >>
        \new Staff \with { instrumentName = "Bass" } \Basse
      >>
    } %\form
  }  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Vocala4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
          \addlyrics \verse
          \addlyrics \verseB
        >>
      >>
    } 
    \markup {
      \vspace #5
      \fill-line {
        \hspace #1
        \column {
          \line { 2- }
          \line { Laissons le champ libre à l'oiseau, }
          \line { nous serons tous les deux priso- }
          \line { -nniers sur paroles.  }
          \line { Au Diable les maîtresses queue   }
          \line { qui attachent les coeurs aux queues  }
          \line { des casseroles. }
          \line { J'ai l'honneur de... }
          \hspace #2

          \line { 4- }
          \line { On leur ôte bien des attraits }
          \line { en dévoilant trop les secrets }
          \line { de Mélusine. }
          \line { L'encre des billets doux pâlit }
          \line { vite entre les feuillets des li- }
          \line { -vres de cuisine. }
          \line { J'ai l'honneur de... }
        }
        \hspace #2
        \column {
          \line { 3- }
          \line { Vénus se fait vieille souvent }
          \line { elle perd son latin devant }
          \line { la lèche-frites. }
          \line { A aucun prix, moi je ne veux }
          \line { effeuiller dans le pot-au-feu }
          \line { la marguerite. }
          \line { J'ai l'honneur de... }
          \hspace #2

          \line { 5- }
          \line { Il peut sembler de tout repos }
          \line { de mettre à l'ombre au fond d'un pot }
          \line { de confiture }
          \line { la jolie pomme défendue, }
          \line { mais elle est cuite, elle a perdu }
          \line { son goût nature. }
          \line { J'ai l'honneur de... }
        }
        \hspace #2
    }}
    \markup {
        \vspace #1
      \fill-line {
        \column {
          \line { 6- }
          \line { De servante n'ai pas besoin }
          \line { et du ménage et de ses soins }
          \line { je te dispense. }
          \line { qu'en éternelle fiancée }
          \line { à la dame de mes pensées }
          \line { toujours je pense. }
          \line { J'ai l'honneur de... }
      }}
    }
} }