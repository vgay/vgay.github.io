\version "2.22.1"
#(set-global-staff-size 17)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##t
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
}

title = #"Sous le ciel de Paris"
composer = #"Hubert Giraud"
meter = #"(Jazz Waltz)"
kwtempo = #"Medium"
kwstyle = #"Jazz Waltz"


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
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
  }
}

form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AA'BC then D.C. al Coda" } }
}

theNotes = \relative c' {
  \key as \major \time 3/4
  \A
  \showStartRepeatBar \bar "[|:"
  \repeat volta 2 {
    \A c4 f g | as2 bes4 | c bes as | g f es |
    des2. | c' | bes~ | bes2 r4 | \break
    c,4 e f | g2 as4 | bes des c | bes as g | 
    \tweak self-alignment-X #RIGHT
    \mark \markup  \with-color #(x11-color 'red) "To Coda"
    f2.~ | 
  }
  \alternative {
    { f2.~ | f2. | R2.  } 
    { f2.\repeatTie ~ | f2 r4 | | g as g \bar "||" } }
  \bar "||" \break 
  \B f2. | f | f | g4 as g | f2. | f | f | g4 as g | \break
  f2 g4 | as2 bes4 | c des es | des c bes| c2.~ | c~ | c~ | c4 r2 \bar "||" \break
  \C c,4 f g | as2 bes4 | c bes as | g f es |
  des2. | c' | bes~ | bes2 r4 | \break
  c,4 e f | g2 as4 | bes des c | 
  bes4 as g | a2.~ | a2.~ | a4 r  \startParenthesis \parenthesize  c _\markup { "(Play " \box D" 1st x only)" } | 
  c a \endParenthesis \parenthesize f \bar "||" \break
  \doubleMark 
  \markup {\with-color #(x11-color 'red) \bold "D.C. al Coda"}
  \markup { \fontsize #2 \box \bold D }
  
  e2. | e~ | e4 r c' | c a f |
  es2. | es~ | es4 r c' | c a f | \break
  d2. | d~ | d4 r bes' | bes f es |
  des!2.~ | 2.~ | 2. | f4 es des | \break
  c2 4 | des2 4 | d2 4 | e2 4 | f2 4 | g2 4 |
  a2 r4 | bes a bes | \break
  c2.~ | 2.~ | 4 r c | d bes g | c2.~ | 2.~ | c2.~ | 2. \break \bar "|."
  
  
  \mark \markup \with-color #(x11-color 'red) \bold \larger \musicglyph #"scripts.varcoda"
  a2.~ | a2.~ | a2.~| a2.~ | a2. \fermata
  \bar ".."
}


harmonies = \chordmode {
  f2.*4:m7 bes2.:m7 bes:m7/as bes:m6/g bes:m7/f
  c2.*4:9- f2.:m f:m/es bes:m7/des c:7
  bes2.:m7 f:m7 s bes:m7 s es:7 s as:6 s s s
  des bes:m7 g:5-7 s c:7 c:7/bes f:m/as c:7/g
  f2.*4:m7 bes2.:m7 bes:m7/as bes:m6/g bes:m7/f
  c2.*3:7 
  c2.:7 f2.*4:6
  f2.*4:7+ c:m7 bes:7 bes:m7 f2.:7+ a:7 d:m7 c:7 g:m7 c:7 f:7+ g:m7 f:7+ s c:dim s c c:7 f:m s  
  f:7+ c:7 f:7+ c:7 f:6
}

voltaEnd = \markup {2 \text \fontsize #2 \italic \with-color #red { or To Coda last x } }

grille = \chordmode {
  \bar "[|:"
  \repeat percent 4 { f1:m7 } \break
  bes:m7 bes:m/as bes:m/g bes:m7/f \break
  \repeat percent 4 { c1:9- } \break
  \set Score.repeatCommands = #'((volta "1"))
  f:m7 \set Score.repeatCommands = #'((volta #f)) 
  f:m7/es
  bes:m7/des
  c:9-
  
  \bar ":|]" \break

  \set Score.repeatCommands = #(list(list 'volta voltaEnd))
  f:m7 \set Score.repeatCommands = #'((volta #f)) 
  bes:m7
  \repeat percent 2 f:m7
  \bar "||" \break 
  \repeat percent 2 { bes:m7 }
  \repeat percent 2 { es:7 } \break
  \repeat percent 4 { as:6 } \break
  des bes:m7 \repeat percent 2 { g:5-7 } \break
  c:7 c:7/bes f:m/as c:7/g  \bar "||" \break
  
  \repeat percent 4 { f1:m7 } \break
  bes:m7 bes:m/as bes:m/g bes:m7/f \break
  \repeat percent 4 { c1:9- } \break
  \repeat percent 4 { f1:6 } \bar "||" \pageBreak
  
  \repeat percent 4 { f1:7+ } \break
  \repeat percent 4 { c1:m7 } \break
  \repeat percent 4 { bes1:7 } \break
  \repeat percent 4 { bes1:m7 } \break
  f:7+ f:5+7 g:m7 c:7 \break
  g:m7 c:7 f:7+ g:m7 \break
  \repeat percent 2 f:7+ \repeat percent 2 c:dim7 \break
  c c:7 \repeat percent 2 f:m6 \break \bar "|."
  \Coda
  f:7+ c:7 f:7+ c:7 \break
  f:6 \bar ".." \stopStaff s \bar ""  s \bar "" s \bar ""
 
  %   c:7 
  %   \repeat percent 3 { f:6 } \bar "|." \break
  %   \Coda
  %   f:m
  %   bes:m7
  %   \repeat percent 2 { f:m }
  %   \bar ".."
}

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*19 
  s1 ^\markup \bold \box \fontsize #7 B s1*15 
  s1 ^\markup \bold \box \fontsize #7 C s1*15 
  s1 ^\markup \bold \box \fontsize #7 D 
}

verse = \lyricmode {
  Sous le ciel de Pa -- ris
  S'en -- vo -- l'u -- ne chan -- son
  Hum Hum __
  Elle est née d'au -- jour -- d'hui
  Dans le coeur d'un gar -- çon __ ⁣
  \repeat unfold 3 { \skip 1 } de Ber -- cy 
  Un phi -- lo -- sophe as -- sis
  Deux mu -- si -- ciens quel -- ques ba -- dauds
  Puis les gens par mil -- liers __
  Sous le ciel de Pa -- ris
  Jusqu' -- au soir vont chan -- ter
  Hum Hum __
  L'hym -- ne d'un peupl' é -- pris
  De sa vieil -- le ci -- té __
  Près de No -- tre Da -- me __
  Par -- fois couve un dra -- me __
  Oui mais à Pa -- na -- me __
  Tout peut s’ar -- ran -- ger __

  Quel -- ques ra -- yons
  De ciel d’é -- té
  L’ac -- cor -- dé -- on
  D’un ma -- ri -- nier
  L’es -- poir fleu -- rit __
  Au ciel de Pa -- ris __
  Ciel __
  %vieil -- le ci -- té
}

verseB = \lyricmode {
  Sous le ciel de Pa -- ris
  Mar -- chent des a -- mou -- reux
  Hum Hum __
  Leur bon -- heur se cons -- truit
  Sur un air fait pour eux __ \skip 1

  Sous le pont 
}

verseC = \lyricmode {
  Sous le ciel de Pa -- ris
  Coul' un fleu -- ve jo -- yeux
  Hum Hum __
  Il en -- dort dans la nuit
  Les clo -- chards et les gueux __
  \repeat unfold 4 { \skip 1 }
  de Pa -- ris
  A son se -- cret pour lui
  De -- puis vingt siècles, il est é -- pris
  De notr' I -- le Saint Louis __
  Quand el -- le lui sou -- rit
  Il met son ha -- bit bleu
  Hum Hum __
  Quand il pleut sur Pa -- ris
  C'est qu'il est mal -- heu -- reux __
}


verseD = \lyricmode {
  Sous le ciel de Pa -- ris
  Les oi -- seaux du Bon Dieu
  Hum Hum __
  Vien -- nent du mond' en -- tier
  Pour ba -- var -- der entr' eux  __ \skip 1

  Et le ciel  
}

verseE = \lyricmode {
  Quand il est trop ja -- loux
  De ses mil -- lions d'a -- mants
  Hum Hum __
  Il fait gron -- der sur nous
  Son ton -- nerr' é -- cla -- tant  __
}

verseF = \lyricmode {
  Mais le ciel de Pa -- ris
  N'est pas long -- temps cru -- el
  Hum Hum __ 
  Pour se fair' par -- don -- ner
  Il offr' un arc en 
}

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "CTab")
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff \with { instrumentName = \CleSol \consists "Merge_rests_engraver" } <<
          \new Voice \with { \consists "Pitch_squash_engraver" } \theNotes
      >> >>
    } \form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "BbTab") 
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c d \harmonies
        } 
        \new Staff \with { instrumentName = \Bb \consists "Merge_rests_engraver" } <<
          \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c d \theNotes
      >> >>
    } \form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "EbTab")
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Eb \consists "Merge_rests_engraver" } <<
          \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c a \theNotes
      >> >>
    } \form
} }

\book {
  \paper {
    #(set-paper-size "a4")
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff \with { instrumentName = \CleSol } 
        <<
          \new Voice \theNotes
      >> >>
    } \form }
  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
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
        }
        \grille
      >>
    } \form
} }

\book {
  \paper {
    #(set-paper-size "a4")
  }
  #(define output-suffix "Bba4") 
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c d \harmonies
        } 
        \new Staff \with { instrumentName = \Bb \consists "Merge_rests_engraver" } <<
          \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c d \theNotes
      >> >>

    } \form }
  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
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
        }
        \transpose c d \grille
      >>
    } \form
} }
\book {
  \paper {
    #(set-paper-size "a4")
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Eb \consists "Merge_rests_engraver" } <<
          \new Voice = "PartPOneVoiceOne" { \transpose c a \theNotes }
      >> >>
    } \form }
  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
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
        }
        \transpose c a \grille
      >>
    } \form
} }
\book {
  \paper {
    #(set-paper-size "a4")
  }
  #(define output-suffix "Vocala4")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff \with { instrumentName = \CleSol } 
        <<
          \new Voice \theNotes
          \addlyrics \verse
          \addlyrics \verseB
%           \addlyrics \verseC
%           \addlyrics \verseD
%           \addlyrics \verseE
%           \addlyrics \verseF      
      >> >>
    } \form

    \markup {
  \vspace #5
  \fill-line {
    \hspace #1
    \column {
      \line { Sous le ciel de Paris }
      \line { Coule un fleuve joyeux Hum Hum }
      \line { Il endort dans la nuit  }
      \line { Les clochards et les gueux  }
      \line { Sous le ciel de Paris  }
      \line { Les oiseaux du Bon Dieu Hum Hum }
      \line { Viennent du monde entier  }
      \line { Pour bavarder entre eux }
      \line { Et le ciel de Paris }
      \line { A son secret pour lui }
      \line { Depuis vingt siècles  }
      \line { il est épris }
      \line { De notre Ile Saint Louis  }
    }
    \hspace #2
    \column {
      \line { Quand elle lui sourit }
      \line { Il met son habit bleu hum hum }
      \line { Quand il pleut sur Paris }
      \line { C'est qu'il est malheureux  }
      \line { Quand il est trop jaloux }
      \line { De ses millions d'amants Hum Hum }
      \line { Il fait gronder sur nous }
      \line { Son tonnerre éclatant }
      \line { Mais le ciel de Paris }
      \line { N'est pas longtemps cruel Hum Hum }
      \line { Pour se fair' pardonner }
      \line { Il offre un arc en ciel. }
    }
    \hspace #1
  }
}
} }
%{
convert-ly (GNU LilyPond) 2.22.1  convert-ly: Traitement de «  »...
Conversion en cours : 2.20.0, 2.21.0, 2.21.2, 2.22.0
%}
